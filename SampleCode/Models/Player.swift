//
//  Player.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

/// Holds the score and the name of the player
/// For the purpose of this Sample Code, the game is only in single player. The original project supports multiplayer on a single device.
/// This is the reason why player.name is unused.
class Player {
    let name: String?
    var score: Int = 0
    
    init(name: String? = "Player") {
        self.name = name
    }
}
