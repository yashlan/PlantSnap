//
//  PlantDetailsController.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import Foundation

class PlantDetailsController: ObservableObject {
    
    @Published var plantDetailsResponse: PlantDetailsResponse = PlantDetailsResponse()
    @Published var plantDetailsGuideResponse: PlantDetailsGuideResponse = PlantDetailsGuideResponse()
    let plantId: Int
    var isLoading: Bool = true
    
    init(plantId: Int, fetchFromLocal: Bool)
    {
        self.plantId = plantId

        if(fetchFromLocal)
        {
            fetchDataLocal(loadingTime: .now() + 2)
        }
        else 
        {
            fetchData(id: self.plantId)
        }
    }
    
    private func fetchData(id: Int) {
                
        guard let url = URL(string: Constant.Routes.PlantDetailsUrl(plantID: id)) else
        {
            print("Invalid Url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let responseHandler = HTTPResponseHandler(response: response, data: data, error: error)
            
            switch responseHandler {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(PlantDetailsResponse.self, from: data)
                    DispatchQueue.main.async { [self] in
                        self.plantDetailsResponse = decodedData
                        fetchGuideData(url: self.plantDetailsResponse.careGuidesUrl ?? "")
                        self.isLoading = false
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
        print("fetch data detail local")
        
        if let path = Bundle.main.path(forResource: "response_detail", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodedData = try JSONDecoder().decode(PlantDetailsResponse.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: loadingTime) { [self] in
                    self.plantDetailsResponse = decodedData
                    fetchGuideDataLocal()
                    self.isLoading = false
                }
            } catch {
                print("Error loading data from local: \(error)")
            }
        } else {
            print("Local JSON file not found")
        }
    }
    
    private func fetchGuideData(url: String)
    {
        var newUrl = ""
        
        if url.hasPrefix("http://") {
            newUrl = url.replacingOccurrences(of: "http://", with: "https://")
        }
        
        guard let url = URL(string: newUrl) else
        {
            print("Invalid Url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let responseHandler = HTTPResponseHandler(response: response, data: data, error: error)
            
            switch responseHandler {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(PlantDetailsGuideResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.plantDetailsGuideResponse = decodedData
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
    
    private func fetchGuideDataLocal()
    {
        print("fetch data guide local")
        
        if let path = Bundle.main.path(forResource: "guide", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodedData = try JSONDecoder().decode(PlantDetailsGuideResponse.self, from: data)
                DispatchQueue.main.async {
                    self.plantDetailsGuideResponse = decodedData
                }
            } catch {
                print("Error loading data from local: \(error)")
            }
        } else {
            print("Local JSON file not found")
        }
    }
}
