//
//  WordGenerator.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

/// Handles retrieval of Words in the Database
class WordGenerator {
    
    /// Retrieves  [count] number of Word objects from the Database
    static func getRandomWords(count: Int) -> [Word]? {
        
        // Retrieve all available Word objects
        let allWords = RealmManager.shared.getAllObjects(Word.self)
        
        // Check if there are enough objects 
        if allWords.count >= count {
            // Generate #[count] unique random indices
            var randomIndices = Set<Int>()
            while randomIndices.count < count {
                randomIndices.insert(Int.random(in: 0..<allWords.count))
            }

            // Retrieve #[count] random objects using the random indices
            let randomObjects = randomIndices.map { allWords[$0] }
            return randomObjects
        } else {
            print("There are not enough objects in the Realm to select \(count) random ones.")
        }
        
        return nil
    }
    
}
