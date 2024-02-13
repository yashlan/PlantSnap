//
//  ContentView.swift
//  PlantSnap
//
//  Created by M Yashlan on 03/02/24.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject private var plantListController: PlantListController
    
    init()
    {
        self._plantListController = StateObject(wrappedValue: PlantListController(fetchFromLocal: Constant.Config.FetchDataFromLocal))
    }
    
    var body: some View {
        PlantListView(plantResponse: plantListController.plantResponse, isLoading: plantListController.isLoading)
            .preferredColorScheme(Constant.Config.MyColorScheme)
    }
}
