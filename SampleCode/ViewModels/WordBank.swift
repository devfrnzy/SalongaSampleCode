//
//  WordBank.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

/// Contains all the Word objects that will be used for the game
class WordBank {
    
    private var size: Int
    private var words: [Word]  = []
    private var currentWordIndex = 0
    
    init(size: Int) {
        self.size = size
        words = WordGenerator.getRandomWords(count: size) ?? []
    }
    
    init(words: [Word]) {
        self.size = words.count
        self.words = words
    }
    
    /// Checks if currentWordIndex is already the last index of the words array
    var hasWordsLeft: Bool {
        return (currentWordIndex + 1) < words.endIndex
    }
    
    /// Retrieves the Word based on the currentWordIndex
    var currentWord: Word {
        return words[currentWordIndex]
    }
    
    /// Increase the  current word index by 1 if there are still available words
    func next() {
        if !hasWordsLeft {
            return
        }
        currentWordIndex += 1
    }
    
    /// Generates a new set of Words based on initial size
    func refresh() {
        words = WordGenerator.getRandomWords(count: size) ?? []
        currentWordIndex = 0
    }
    
}
