//
//  PlantListController.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import Foundation

class PlantListController: ObservableObject {
    
    @Published var plantResponse: PlantListResponse = PlantListResponse()
    var isLoading: Bool = true
    private static var plantResponseDataTemp: Data? = nil
    
    init(fetchFromLocal: Bool)
    {
        if(fetchFromLocal)
        {
            fetchDataLocal(loadingTime: .now() + 2)
        }
        else 
        {
            fetchData()
        }
    }
    
    private func fetchData() {
        
        if PlantListController.plantResponseDataTemp != nil {
            do {
                let decodedData = try JSONDecoder().decode(PlantListResponse.self, from: PlantListController.plantResponseDataTemp!)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.plantResponse = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
            return
        }
        
        print("fetch data")
        
        guard let url = URL(string: Constant.Routes.PlantListUrl) else
        {
            print("Invalid Url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let responseHandler = HTTPResponseHandler(response: response, data: data, error: error)
            
            switch responseHandler {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(PlantListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.plantResponse = decodedData
                        self.isLoading = false
                        PlantListController.plantResponseDataTemp = data
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            case .rateLimitExceeded(let remainingAttempts):
                print("Rate limit exceeded. Retrying. Remaining attempts: \(remainingAttempts)")
                
            case .unexpectedResponse(let statusCode):
                print("Unexpected response: \(statusCode)")
                
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }.resume()

    }
    
    private func fetchDataLocal(loadingTime: DispatchTime)
    {
        print("fetch data local")
        
        if let path = Bundle.main.path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodedData = try JSONDecoder().decode(PlantListResponse.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: loadingTime) {
                    self.plantResponse = decodedData
                    self.isLoading = false
                }
            } catch {
                print("Error loading data from local: \(error)")
            }
        } else {
            print("Local JSON file not found")
        }
    }
}
