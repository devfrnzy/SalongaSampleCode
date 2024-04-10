//
//  GameSettingsPopup.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// User will be able to set the number of rounds/words and the time per round in this popup
/// Proceeds to GameView() once the user decides to start the game
struct GameSettingsPopup: View {
    @State var roundsInput = "3"
    @State var secondsInput = "10"
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var gameSettings: GameSettings
    
    @FocusState var isTextFieldOnFocus: Bool
    
    /// A proxy in order to parse Double to Int for the Round Count while being binded in a Slider
    var roundCountProxy: Binding<Double> {
        Binding<Double>(get: {
            //Returns the score as a Double
            return Double(self.gameSettings.roundCount)
        }, set: {
            //Rounds the double to an Int
            self.gameSettings.roundCount = Int($0)
        })
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black.opacity(0.2))
                .onTapGesture {
                    coordinator.dismissFullScreenCover()
                }
            VStack {
                Text("Round Settings")
                    .popupTitle()
                roundCountSettingsBar
                roundTimeSettingsBar
                Spacer()
                    .frame(height: 25)
                CapsuleButton("Start", fontSize: 20) {
                    coordinator.push(.game)
                    coordinator.dismissFullScreenCover()
                }
                .padding(.horizontal, 60)
                
            }
            .foregroundColor(.themePurple)
            .font(.custom("Fredoka-Regular", size: 20))
            .padding(20)
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .background {
                PopupBackground()
            }
        }
        .presentationBackground(.black.opacity(0.2))
    }
    
    /// Round Count's Slider and Text field
    var roundCountSettingsBar: some View {
        VStack {
            HStack {
                Text("Rounds")
                    .font(.custom("Fredoka-Medium", size: 20))
                Spacer()
                TextField("", text: $roundsInput, onEditingChanged: { edit in
                    if let numericValue = Int(roundsInput) {
                        // Ensure the numericValue is within the slider's range
                        gameSettings.roundCount = min(max(numericValue, 3), 30)
                    }
                },     onCommit: {
                    if let numericValue = Int(roundsInput) {
                        // Ensure the numericValue is within the slider's range
                        gameSettings.roundCount = min(max(numericValue, 3), 30)
                        roundsInput = "\(gameSettings.roundCount)"
                    }
                })
                .roundSettingStyle()
                .focused($isTextFieldOnFocus)
                .onAppear {
                    roundsInput = "\(Int(gameSettings.roundCount))"
                }
            }
            
            Slider(value: roundCountProxy, in: 3...30) {
            } minimumValueLabel: {
                Text("3")
            } maximumValueLabel: {
                Text("30")
            }.onChange(of: gameSettings.roundCount) { newValue in
                roundsInput = "\(Int(newValue))"
            }
            .accentColor(.themePurple)
        }
    }
    
    /// Round Time's Slider and Text field
    var roundTimeSettingsBar: some View {
        VStack {
            HStack {
                Text("Round Time")
                    .font(.custom("Fredoka-Medium", size: 20))
                Spacer()
                TextField("", text: $secondsInput, onEditingChanged: { edit in
                    if let numericValue = Int(secondsInput) {
                        // Ensure the numericValue is within the slider's range
                        gameSettings.roundTime = Double(min(max(numericValue, 3), 30))
                    }
                },     onCommit: {
                    if let numericValue = Int(secondsInput) {
                        // Ensure the numericValue is within the slider's range
                        gameSettings.roundTime = Double(min(max(numericValue, 3), 30))
                        secondsInput = "\(Int(gameSettings.roundTime ))"
                    }
                })
                .roundSettingStyle()
                .focused($isTextFieldOnFocus)
                .onAppear {
                    secondsInput = "\(gameSettings.roundTime)"
                }
                Text("seconds")
                    .font(.custom("Fredoka-Medium", size: 20))
            }
            Slider(value: $gameSettings.roundTime, in: 3...30, step: 1.0) {
            } minimumValueLabel: {
                Text("3")
            } maximumValueLabel: {
                Text("30")
            }.onChange(of: gameSettings.roundTime) { newValue in
                secondsInput = "\(Int(newValue))"
            }
            .accentColor(.themePurple)
        }
    }
}
