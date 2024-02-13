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
        HStack {
            if let thumbnailUrl = plantData.defaultImage?.thumbnail, !thumbnailUrl.isEmpty {
                AsyncImageCached(url: URL(string: plantData.defaultImage!.thumbnail)) {
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.gray)
                    .cornerRadius(8)
                    .overlay {
                        VStack {
                            Text("No Image")
                                .bold()
                                .font(.caption)
                                .padding(4)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                        .background(Color.black)
                                .opacity(0.8)
                                .cornerRadius(10.0)
                    }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(plantData.commonName)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                Text(plantData.scientificName[0])
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                    .italic()
            }
        }
    }
}
