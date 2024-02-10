//
//  PlantListView.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import SwiftUI

struct PlantListView : View {
    
    let plantResponse: PlantListResponse
    
    var body: some View {
        List {
            ForEach(plantResponse.data.indices, id: \.self) { index in
                PlantListItemView(plantData: plantResponse.data[index])
            }
        }
    }
}
