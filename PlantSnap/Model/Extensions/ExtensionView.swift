//
//  ExtensionView.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import SwiftUI

extension View {
    func setCenterNavigationTitle() -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Spacer()
                }
            }
    }
}
