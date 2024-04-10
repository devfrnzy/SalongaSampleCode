//
//  PauseView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Shown to the user when the pause button is tapped in the GameView
/// The user may go back to Home screen, show Settings Popup, or About Us/Credits popup from this view
struct PauseView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State var isQuitAlertShown = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black.opacity(0.2))
                .onTapGesture {
                    coordinator.dismissFullScreenCover()
                }
            VStack {
                Text("Paused")
                    .popupTitle()
                
                //TODO: Add buttons leading to Settings and About Us/Credits popup
                
                CapsuleButton("Resume", fontSize: 17) {
                    coordinator.dismissFullScreenCover()
                }
                .padding(.horizontal, 60)
                
                CapsuleButton("Quit", fontSize: 17, color: .themeDarkRed, borderColor: .themePastelRed) {
                    isQuitAlertShown = true
                }
                .padding(.horizontal, 60)
                
            }
            .padding(20)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .background {
                Image("popupBG")
                    .resizable()
                    .cornerRadius(30)
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 5)
                    .foregroundColor(.gray)
                
            }
        }
        .presentationBackground(.black.opacity(0.2))
        .alert(isPresented: $isQuitAlertShown) {
            Alert(title: Text("Quit"), 
                  message: Text("Are you sure you want to quit"),
                  primaryButton: .destructive(Text("Quit")) {
                // Bring the user back to Home Screen
                coordinator.popToRoot()
                coordinator.dismissFullScreenCover()
            },
            secondaryButton: .cancel())
        }
    }
}

#Preview {
    PauseView()
}
