//
//  HowToPopup.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// <UNDER DEVELOPMENT>
/// This should show the instructions on how to play the game
struct HowToPopup: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black.opacity(0.2))
                .onTapGesture {
                    coordinator.dismissFullScreenCover()
                }
            VStack {
                Text("How to Play")
                    .popupTitle()
                //TODO: Add actual How to play instructions
                Text("<Under Construction>")
                    .font(.custom("Fredoka-Medium", size: 20))
                CapsuleButton("OK", fontSize: 17) {
                    coordinator.dismissFullScreenCover()
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
    }
}

#Preview {
    HowToPopup()
}
