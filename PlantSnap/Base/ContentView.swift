//
//  ContentView.swift
//  PlantSnap
//
//  Created by M Yashlan on 03/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var plantListController = PlantListController()
    
    var body: some View {
        NavigationView {
            PlantListView(plantResponse: plantListController.plantResponse)
                .onAppear(perform: {
                    plantListController.fetchData()
                })
                .navigationTitle("Plant List")
        }
    }
}

#Preview {
    ContentView()
}
