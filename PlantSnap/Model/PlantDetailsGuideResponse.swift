//
//  PlantDetailsGuideResponse.swift
//  PlantSnap
//
//  Created by M Yashlan on 12/02/24.
//

struct PlantDetailsGuideResponse : Decodable {
    
    var data: [GuideData]? = nil
    
    struct GuideData : Decodable {
        
        var section: [GuideSection]? = nil
        
        struct GuideSection: Decodable, Hashable {
            var type: String? = nil
            var description: String? = nil
        }
    }
}
