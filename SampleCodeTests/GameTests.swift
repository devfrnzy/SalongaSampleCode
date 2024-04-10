//
//  GameTests.swift
//  SampleCodeTests
//
//  Created by Emmanuel Salonga on 4/10/24.
//

import XCTest

/// Test for class Game
///  IMPORTANT NOTE: game.reset() will be unavailable for testing due to issues with RealmDB
final class GameTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let gameSettings = GameSettings(roundTime: 3, roundCount: 10)
        let wordA = Word()
        wordA._id = "1"
        wordA.wordLyric = "Test"
        
        let wordB = Word()
        wordB._id = "2"
        wordB.wordLyric = "Game"
        
        let wordC = Word()
        wordC._id = "3"
        wordC.wordLyric = "Time"
        
        let words = [wordA,wordB, wordC]
        let wordBank = WordBank(words: words)
        game = Game(gameSettings: gameSettings, wordBank: wordBank)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testGameStart() {
        // Game state should always be <.notStarted> at first
        XCTAssertEqual(game.gameState, .notStarted)
        
        game.start()
        
        // Game state should move to <.ongoing> once the game starts
        XCTAssertEqual(game.gameState, .ongoing)
        XCTAssertNotNil(game.currentWord)
    }
    
    func testGamePauseAndResume() {
        game.start()
        
        XCTAssertEqual(game.gameState, .ongoing)
        
        game.pause()
        
        XCTAssertEqual(game.gameState, .paused)
        
        game.resume()
        
        XCTAssertEqual(game.gameState, .ongoing)
    }
    
    func testPreventPauseIfGameIsNotOngoing() {
        game.start()
        
        XCTAssertEqual(game.gameState, .ongoing)
        
        // Simulate time's up
        game.roundTimer.endTimer()
        
        XCTAssertEqual(game.gameState, .roundFinished)
        
        // Simulate a call on pause. There are instances where the user can pause the game due to opening the Song list.
        game.pause()
        
        XCTAssertEqual(game.gameState, .roundFinished)
    }
    
    func testRoundFinish() {
        game.start()
        
        XCTAssertEqual(game.gameState, .ongoing)
        
        // Simulate time's up
        game.roundTimer.endTimer()
        
        XCTAssertEqual(game.gameState, .roundFinished)
        
        // Once the round is finished, we should be able to proceed to the next word if there are still available words.
        // In this case, we have 3 words and we only went through 1. We should be able to proceed to the next wor
        game.nextWord()
        
        XCTAssertEqual(game.gameState, .ongoing)
    }
    
    func testGameFinish() {
        game.start()
        
        XCTAssertEqual(game.gameState, .ongoing)
        
        // Let's simulate all rounds finishing
        game.nextWord()
        game.nextWord()
        game.nextWord()
        
        XCTAssertEqual(game.gameState, .finished)
    }
    
    func testSkipWord() {
        game.start()
        
        XCTAssertEqual(game.gameState, .ongoing)
        
        // Let's skip the current word
        game.skip()
        
        XCTAssertEqual(game.gameState, .roundFinished)
    }
    
    func testAddScore() {
        game.start()
        
        // Score should always be 0 at the Start of the game
        XCTAssertEqual(game.player.score, 0)
        
        // Let's add score.
        game.addScore()
        
        // Score added should always be 1
        XCTAssertEqual(game.player.score, 1)
    }
    
}
