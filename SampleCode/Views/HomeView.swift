//
//  HomeView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// The first view that the user sees.
struct HomeView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @State var showGameConfig = false
    
    var body: some View {
        
        ZStack {
            BackgroundVideoView()
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                Spacer()
                    .frame(height: 50)
                VStack {
                    CapsuleButton("Start") {
                        coordinator.present(fullScreenCover: .gameSettings)
                    }
                    
                    CapsuleButton("How to play") {
                        coordinator.present(fullScreenCover: .howToPlay)
                    }

                }
                .padding(.horizontal, 60)
            }
        }
    }
}

#Preview {
    HomeView()
}
