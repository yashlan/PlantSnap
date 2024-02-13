//
//  Plant.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//


struct PlantListResponse: Decodable {
    
    var data: [PlantData] = []
    
    struct PlantData: Decodable {
        let id: Int
        let commonName: String
        let scientificName: [String]
        let defaultImage: DefaultImage?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case commonName = "common_name"
            case scientificName = "scientific_name"
            case defaultImage = "default_image"
        }
        
        struct DefaultImage: Decodable {
            let thumbnail: String
        }
    }
}
