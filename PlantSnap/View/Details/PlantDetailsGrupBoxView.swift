//
//  PlantDetailsGrupBoxView.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import SwiftUI

struct PlantDetailsGrupBoxView : View {
    
    let plantDetailResponse: PlantDetailsResponse

    var body: some View {
        Text("Details")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.black)
        
        GroupBox {
            VStack(alignment: .leading, spacing: 4) {
                Text("Type:").bold() + Text(plantDetailResponse.type?.capitalized ?? "-")
                Text("Cycle: ").bold() + Text(plantDetailResponse.cycle?.capitalized ?? "-")
                Text("Propagation: ").bold() + Text(plantDetailResponse.propagation?.joined(separator: ", ").capitalized ?? "-")
                Text("Watering: ").bold() + Text(plantDetailResponse.watering?.capitalized ?? "-")
                Text("Sunlight: ").bold() + Text(plantDetailResponse.sunlight?.joined(separator: ", ").capitalized ?? "-")
                Text("Pruning Month: ").bold() + Text(plantDetailResponse.pruningMonth?.joined(separator: ", ").capitalized ?? "-")
                Text("Growth Rate: ").bold() + Text(plantDetailResponse.growthRate?.capitalized ?? "-")
                Text("Care Level: ").bold() + Text(plantDetailResponse.careLevel?.capitalized ?? "-")
                Text("Flowers: ").bold() + Text(plantDetailResponse.flowers ?? false ? "Yes" : "No")
                Text("Flower Color: ").bold() + Text(plantDetailResponse.flowerColor?.isEmpty == true ? "-" : plantDetailResponse.flowerColor?.capitalized ?? "-")
                Text("Leaf: ").bold() + Text(plantDetailResponse.leaf ?? false ? "Yes" : "No")
                Text("Leaf Color: ").bold() + Text(plantDetailResponse.leafColor?.joined(separator: ", ").capitalized ?? "-")
                Text("Maintenance: ").bold() + Text(plantDetailResponse.maintenance?.capitalized ?? "-")
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
        }
    }
}
