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
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                    .clipped()
            }
        }
     }
}
