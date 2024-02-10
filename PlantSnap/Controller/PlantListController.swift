//
//  PlantListController.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import Foundation

class PlantListController: ObservableObject {
    @Published var plantResponse: PlantListResponse = PlantListResponse(data: [])
    
    func fetchData() {
        guard let url = URL(string: "https://perenual.com/api/species-list?key=") else
        {
            print("Invalid Url can't fetching data")
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(PlantListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.plantResponse = decodedData
                        print("data : \(decodedData)")
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
