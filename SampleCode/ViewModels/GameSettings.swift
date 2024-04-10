//
//  GameSettings.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var roundTime: Double = 10.0
    @Published var roundCount: Int = 3
    
    init(roundTime: Double = 10.0, roundCount: Int = 3) {
        self.roundTime = roundTime
        self.roundCount = roundCount
    }
}
