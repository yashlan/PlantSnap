//
//  PlantListItemView.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import SwiftUI


struct PlantListItemView: View {
    
    let plantData: PlantListResponse.PlantData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(plantData.commonName)
                .bold()
            Text("Scientific Name: \(plantData.scientificName[0])")
                .font(.system(size: 11))
                .italic()
            AsyncImage(url: URL(string: plantData.defaultImage?.thumbnail ?? "")) {
                phase in switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                case .failure:
                    Text("Thumbnail Load Failed")
                case .empty:
                    Text("No Image")
                @unknown default:
                    Text("Unknown Error")
                }
            }
        }
    }
}
