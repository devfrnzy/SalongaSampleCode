//
//  GameView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: Game
    @EnvironmentObject var coordinator: AppCoordinator
    @State var pauseOpacity = 0.0
    @State var timeRemaining = 3
    @State var showRoundEnd = false
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                BackgroundVideoView()
                    .ignoresSafeArea()
                VStack(spacing:1) {
                    if game.roundStartTimer.timeRemaining == 0 {
                        Spacer()
                        Text(game.currentWord.wordLyric)
                            .foregroundColor(.themeYellow)
                            .minimumScaleFactor(0.01)
                            .shadow(color: .black, radius: 1, x: 2, y: 2)
                            .font(.custom("Pacifico-Regular", size: 120))
                            .lineLimit(1)
                            .padding(.horizontal)
                        VStack {
                            countdownTimer
                                .padding(.top)
                                .padding(.horizontal)
                            playerButtons
                                .padding()
                        }.background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 1, x: 2, y: 2)
                            
                        }
                    } else {
                        Spacer()
                        Text("\(timeRemaining)")
                            .font(.custom("Fredoka-Regular", size: 200))
                            .foregroundColor(.themeYellow)
                            .shadow(color: .black, radius: 1, x: 2, y: 2)
                        
                    }
                    if showRoundEnd {
                        roundFinishButtons
                            .padding()
                    }
                    Spacer()
                }.onReceive(game.roundStartTimer.$timeRemaining) { timeRemaining in
                    self.timeRemaining = Int(timeRemaining)
                }
                .onReceive(game.$gameState) { gameState in
                    if gameState == .roundFinished {
                        withAnimation {
                            showRoundEnd = true
                        }
                    } else {
                        showRoundEnd = false
                    }
                    
                    switch gameState {
                    case .roundFinished:
                        withAnimation {
                            showRoundEnd = true
                        }
                        
                    case .finished:
                        withAnimation {
                            coordinator.push(.gameFinished)
                        }
                    default:
                        showRoundEnd = false
                    }
                }
                .onAppear {
                    game.start()
                }
            }
            .navigationBarBackButtonHidden()
            .onReceive(coordinator.$fullScreenCover) { fullScreenCover in
                if fullScreenCover == nil && game.gameState == .paused {
                    game.resume()
                }
            }
        }
    }
    
        var countdownTimer: some View {
            CountdownTimerView(viewModel: game.roundTimer)
                .padding(.horizontal)
                .cornerRadius(20)
        }
    
    var roundFinishButtons: some View {
        VStack {
            Text("Time's up! Were you able to sing it?")
                .font(.custom("Fredoka-Medium", size: 20))
                .foregroundColor(.themeDarkPurple)
            
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        game.nextWord()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius:50)
                            .aspectRatio(180/50, contentMode: .fit)
                            .foregroundColor(.themeDarkRed)
                            .shadow(color: .black, radius: 2, x: 4, y: 3)
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.themePastelRed)
                            .aspectRatio(180/50, contentMode: .fit)
                        Text("No")
                            .foregroundColor(Color(.white))
                            .font(.custom("Fredoka-Regular", size: 20))
                            .shadow(color: .gray, radius: 1, x: 2, y: 2)
                    }
                }
                Button {
                    game.addScore()
                    withAnimation {
                        game.nextWord()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .aspectRatio(180/50, contentMode: .fit)
                            .foregroundColor(Color("themePurple"))
                            .shadow(color: .black, radius: 2, x: 4, y: 3)
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color("themeYellow"))
                            .aspectRatio(180/50, contentMode: .fit)
                        Text("Yes")
                            .foregroundColor(Color(.white))
                            .font(.custom("Fredoka-Regular", size: 20))
                            .shadow(color: .gray, radius: 1, x: 2, y: 2)
                    }
                }
                
            }
        }
    }
    
    var playerButtons: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .center, spacing: 30) {
                Button {
                    game.pause()
                    coordinator.present(fullScreenCover: .songList)
                } label: {
                    
                    Image(systemName: "music.note.list")
                        .resizable()
                        .foregroundColor(.themeDarkPurple)
                        .frame(width: 30, height: 30)
                        .shadow(color: .themePastelTeal, radius: 1, x: 1, y: 1)
                }
                
                Button {
                    game.pause()
                    coordinator.present(fullScreenCover: .pause)
                } label: {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .foregroundColor(.themeDarkPurple)
                                            .frame(width: 30, height: 30)
                        .shadow(color: .themePastelTeal, radius: 1, x: 1, y: 1)
                }
                Button {
                    withAnimation {
                        game.skip()
                    }
                } label: {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .foregroundColor(game.gameState == .roundFinished ? .gray : .themeDarkPurple)
                        .frame(width: 30, height: 30)
                        .shadow(color: .themePastelTeal, radius: 1, x: 1, y: 1)
                }
                
            }
            
        }
    }
    
}
