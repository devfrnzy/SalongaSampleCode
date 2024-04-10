//
//  GameFinishedView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Shown when user is done playing all rounds of the game.
/// User may choose to restart the game with a new set of Words or Go back to Home screen
struct GameFinishedView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var game: Game
    
    var body: some View {
        ZStack {
            BackgroundVideoView()
                .ignoresSafeArea()
            VStack {
                Text("Great job, singer!")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.themeYellow)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .padding()
                Text("Score: \(game.player.score)")
                    .font(.custom("Fredoka-Regular", size: 25))
                    .foregroundColor(.themePurple)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                VStack(spacing: 10) {
                    retryButton
                    quitButton
                }
                .padding(.horizontal, 80)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    var quitButton: some View {
        Button {
            coordinator.popToRoot()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .aspectRatio(180/40, contentMode: .fit)
                    .foregroundColor(.themeDarkRed)
                    .shadow(color: .black, radius: 2, x: 4, y: 3)
                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.themePastelRed)
                    .aspectRatio(180/40, contentMode: .fit)
                Text("Back to Home")
                    .foregroundColor(Color(.white))
                    .font(.custom("Fredoka-Regular", size: 22))
                    .shadow(color: .gray, radius: 1, x: 2, y: 2)
            }
        }
    }
    
    var retryButton: some View {
        Button {
            game.reset()
            coordinator.pop()
        } label: {
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .aspectRatio(180/40, contentMode: .fit)
                        .foregroundColor(Color("themePurple"))
                        .shadow(color: .black, radius: 2, x: 4, y: 3)
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color("themeYellow"))
                        .aspectRatio(180/40, contentMode: .fit)
                    Text("Restart Game")
                        .foregroundColor(Color(.white))
                        .font(.custom("Fredoka-Regular", size: 22))
                        .shadow(color: .gray, radius: 1, x: 2, y: 2)
                }
            }
        }
    }
}
