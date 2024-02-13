//
//  PlantDetailsView.swift
//  PlantSnap
//
//  Created by M Yashlan on 10/02/24.
//

import SwiftUI

struct PlantDetailsView : View {
    
    let plantDetailResponse: PlantDetailsResponse
    let plantDetailGuideResponse: PlantDetailsGuideResponse
    let isLoading: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center) {
                    
                    PlantDetailsHeaderView(originalImageUrl: plantDetailResponse.defaultImage?.originalURL)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(plantDetailResponse.commonName ?? "-")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(plantDetailResponse.scientificName?.first ?? "-")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .italic()
                        
                        Spacer()
                        
                        PlantDetailsGrupBoxView(plantDetailResponse: self.plantDetailResponse)
                        
                        Spacer()
                        
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text(plantDetailResponse.description ?? "-")
                        
                        Spacer()
                        
                        PlantDetailsGuideView(plantDetailGuideResponse: self.plantDetailGuideResponse)

                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                NavigationLink(destination: HomePage()) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .bold()
                            .foregroundColor(.mint)
                        Text("Back")
                            .bold()
                            .foregroundColor(.mint)
                    }
                }
            }
        }
        .overlay(
            Group {
                if isLoading {
                    LoadingView()
                }
            }
        )
    }
}
