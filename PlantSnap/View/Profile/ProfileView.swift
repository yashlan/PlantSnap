//
//  ProfileView.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    private let userProfile: UserProfileModel = UserProfileModel()

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image(userProfile.picturePath)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                    
                    Text(userProfile.userName)
                        .font(.title)
                        .bold()
                }
                
                Spacer().frame(height: 15)
                GroupBox {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "envelope.circle")
                            Text(userProfile.email)
                        }

                        HStack {
                            Image(systemName: "location.circle")
                            Text(userProfile.address)
                        }
                        
                        HStack {
                            Image(systemName: "apple.logo")
                            Text(userProfile.task)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer().frame(height: UIScreen.main.bounds.height / 3)
                
            }
        }
        .navigationTitle("Profile")
        .setCenterNavigationTitle()
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
        .navigationBarBackButtonHidden()
        .edgesIgnoringSafeArea(.all)
    }
}
