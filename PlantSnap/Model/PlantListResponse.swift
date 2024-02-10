//
//  Plant.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//


struct PlantListResponse: Decodable {
    
    let data: [PlantData]
    
    struct PlantData: Decodable {
        let id: Int
        let commonName: String
        let scientificName: [String]
        let cycle: String
        let watering: String
        let sunlight: [String]
        let defaultImage: DefaultImage?

        private enum CodingKeys: String, CodingKey {
            case id
            case commonName = "common_name"
            case scientificName = "scientific_name"
            case cycle, watering, sunlight
            case defaultImage = "default_image"
        }
        
        struct DefaultImage: Decodable {
            let originalURL: String
//            let regularURL: String
//            let mediumURL: String
//            let smallURL: String
            let thumbnail: String

            private enum CodingKeys: String, CodingKey {
                case originalURL = "original_url"
//                case regularURL = "regular_url"
//                case mediumURL = "medium_url"
//                case smallURL = "small_url"
                case thumbnail
            }
        }
    }
}
