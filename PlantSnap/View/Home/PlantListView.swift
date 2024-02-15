//
//  PlantListView.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import SwiftUI

struct PlantListView : View {
    
    let plantResponse: PlantListResponse
    let isLoading: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(plantResponse.data.indices, id: \.self) { index in
                        NavigationLink(destination: DetailPage(plantId: plantResponse.data[index].id)) {
                            PlantListItemView(plantData: plantResponse.data[index])
                        }
                    }
                }
            }
            .navigationTitle("Plant List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfilePage()) {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .tint(.black)
        .overlay(
            Group {
                if isLoading {
                    LoadingView()
                }
            }
        )
    }
}
