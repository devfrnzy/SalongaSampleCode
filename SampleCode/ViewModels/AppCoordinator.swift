//
//  AppCoordinator.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Each case are the Views the app can navigate to
enum Page: String, Identifiable {
    case home, game, gameFinished
    
    var id: String {
        self.rawValue
    }
}

/// Each case are the Views that can be shown as a Full Screen Cover
enum FullScreenCover: String, Identifiable {
    case pause, gameSettings, howToPlay, songList
    
    var id: String {
        self.rawValue
    }
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    /// Contains the default settings of the game
    private var gameSettings = GameSettings()
    private lazy var game: Game = Game(gameSettings: gameSettings)
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        case .gameFinished:
            GameFinishedView(game: self.game)
        case .game:
            GameView(game: self.game)
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .pause:
            PauseView()
        case .gameSettings:
            GameSettingsPopup(gameSettings: self.gameSettings)
        case .howToPlay:
            HowToPopup()
        case .songList:
            SongListPopup()
        }
    }

}
