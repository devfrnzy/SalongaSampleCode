//
//  Game.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation
import Combine


enum GameState: Int {
    case notStarted, ongoing, paused, roundFinished, finished
}

class Game: ObservableObject {
    
    @Published var gameState: GameState = .notStarted
    
    private var cancellables: Set<AnyCancellable> = []
    private var wordBank: WordBank
    var roundTimer = TickTimer(totalTime: 10)
    var roundStartTimer = TickTimer(totalTime: 3, tickInterval: 1.0)
    var gameSettings: GameSettings
    var player: Player = Player()
    var currentWord: Word {
        return wordBank.currentWord
    }
    
    init(gameSettings: GameSettings) {
        self.gameSettings = gameSettings
        wordBank = WordBank(size: self.gameSettings.roundCount)
        roundStartTimer.$timerFinished.sink { timerFinished in
            if timerFinished {
                self.startWordDraw()
            }
        }
        .store(in: &cancellables)
    }
    
    init(gameSettings: GameSettings, wordBank: WordBank) {
        self.gameSettings = gameSettings
        self.wordBank = wordBank
        roundStartTimer.$timerFinished.sink { timerFinished in
            if timerFinished {
                self.startWordDraw()
            }
        }
        .store(in: &cancellables)
    }
    
    func start() {
        gameState = .ongoing
        roundStartTimer.startTimer()
        setupTurnTimer()
    }
    
    func reset() {
        wordBank.refresh()
    }
    
    func setupTurnTimer() {
        roundTimer = TickTimer(totalTime: gameSettings.roundTime)
        roundTimer.$timerFinished.sink { timerFinished in
            if timerFinished {
                self.gameState = .roundFinished
            }
        }
        .store(in: &cancellables)
    }
    
    func startWordDraw() {
        roundTimer.startTimer()
    }
    
    func skip() {
        if gameState == .roundFinished {
            return
        }
        gameState = .roundFinished
        roundTimer.stopTimer()
        roundTimer.timeRemaining = 0
    }
    
    func addScore() {
        player.score += 1
    }
    
    func nextWord() {
        if wordBank.hasWordsLeft {
            wordBank.next()
            gameState = .ongoing
            roundStartTimer.startTimer()
        } else {
            gameState = .finished
        }
    }
    
    func pause() {
        if gameState != .ongoing {
            return
        }
        roundTimer.stopTimer()
        gameState = .paused
    }
    
    func gameFinished() {
        roundTimer.stopTimer()
        gameState = .finished
    }
    
    func resume() {
        if gameState == .paused {
            roundTimer.startTimer()
            gameState = .ongoing
        }
    }
    
}
