//
//  LoadingView.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Please wait...")
                    .foregroundStyle(.black)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
