//
//  File.swift
//  PlantSnap
//
//  Created by M Yashlan on 12/02/24.
//

import SwiftUI

struct Constant {
    
    private struct Domains {
        static let API_KEY = "sk-lNdo65bd2255b9cd74009"
        static let BaseUrl = "https://perenual.com/api/"
    }
    
    struct Config {
        static let FetchDataFromLocal = false;
        static let MyColorScheme: ColorScheme = .light
    }

    struct Routes {
        static let PlantListUrl = Domains.BaseUrl + "species-list?key=" + Domains.API_KEY
        static func PlantDetailsUrl(plantID: Int) -> String {
            return Domains.BaseUrl + "species/details/\(plantID)?key=" + Domains.API_KEY
        }
    }
}
