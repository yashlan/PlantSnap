//
//  PlantDetailPage.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import SwiftUI

struct DetailPage: View {
    
    @StateObject private var plantDetailsController: PlantDetailsController
    
    init(plantId: Int)
    {
        self._plantDetailsController = StateObject(wrappedValue: PlantDetailsController(plantId: plantId, fetchFromLocal: Constant.Config.FetchDataFromLocal))
    }

    var body: some View {
        PlantDetailsView(plantDetailResponse: plantDetailsController.plantDetailsResponse, plantDetailGuideResponse: plantDetailsController.plantDetailsGuideResponse, isLoading: plantDetailsController.isLoading)
            .preferredColorScheme(Constant.Config.MyColorScheme)
    }
}
