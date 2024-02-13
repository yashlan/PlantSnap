//
//  PlantDetailsHeaderView.swift
//  PlantSnap
//
//  Created by M Yashlan on 12/02/24.
//

import SwiftUI

struct PlantDetailsHeaderView : View {
    
    let originalImageUrl: String?
    
    var body: some View {
        ZStack {
            if let photo = originalImageUrl, !photo.isEmpty {
                AsyncImageCached(url: URL(string: self.originalImageUrl ?? "")) {
                    image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                        .clipped()
                } placeholder: {
                    VStack {
                        Text("Loading image...")
                            .foregroundStyle(.gray)
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.gray)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                }
            } else {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                    .clipped()
                    .overlay {
                        VStack {
                            Text("No Image Available")
                                .bold()
                                .font(.title3)
                                .padding(8)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                        .background(Color.black)
                                .opacity(0.8)
                                .cornerRadius(10.0)
                    }
            }
        }
     }
}
