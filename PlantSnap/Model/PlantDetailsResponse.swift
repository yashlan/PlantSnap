//
//  PlantDetailsResponse.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//


struct PlantDetailsResponse: Decodable {
    
    var defaultImage: DefaultImage? = nil
    var commonName: String? = nil
    var scientificName: [String]? = nil
    var description: String? = nil
    var type: String? = nil
    var cycle: String? = nil
    var propagation: [String]? = nil
    var watering: String? = nil
    var sunlight: [String]? = nil
    var pruningMonth: [String]? = nil
    var growthRate: String? = nil
    var careLevel: String? = nil
    var flowers: Bool? = nil
    var flowerColor: String? = nil
    var leaf: Bool? = nil
    var leafColor: [String]? = nil
    var maintenance: String? = nil
    var careGuidesUrl: String? = nil

    private enum CodingKeys: String, CodingKey {
        case defaultImage = "default_image"
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case description
        case type
        case cycle
        case propagation
        case watering
        case sunlight
        case pruningMonth = "pruning_month"
        case growthRate = "growth_rate"
        case careLevel = "care_level"
        case flowers
        case flowerColor = "flower_color"
        case leaf
        case leafColor = "leaf_color"
        case maintenance
        case careGuidesUrl = "care-guides"
    }
    
    struct DefaultImage: Decodable {
        
        var originalURL: String = ""

        private enum CodingKeys: String, CodingKey {
            case originalURL = "original_url"
        }
    }
}
