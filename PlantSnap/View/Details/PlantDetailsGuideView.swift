//
//  PlantDetailsGuideView.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import SwiftUI

struct PlantDetailsGuideView : View {
    
    let plantDetailGuideResponse: PlantDetailsGuideResponse

    var body: some View {
        Text("Guide")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.black)
        
        if let data = plantDetailGuideResponse.data?.first?.section, !data.isEmpty {
            ForEach(data.indices, id: \.self) { index in
                GroupBox {
                    VStack(alignment: .leading) {
                        Text(data[index].type?.capitalized ?? "-")
                            .bold()
                        
                        GroupBox {
                            Text(data[index].description ?? "-")
                        }
                    }
                }
                .padding()
            }
        } else {
            Text("Guide not available")
                .foregroundColor(.gray)
                .italic()
        }
    }
}
