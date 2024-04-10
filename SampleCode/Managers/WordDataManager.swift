//
//  WordDataManager.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation

///  Created as a substitute to Network retrieval of Word List.
///  For the purpose of the sample app, the Word objects are retrieve from a plist file.
class WordDataManager {
    
    /// Creates Word objects from Plist then saves it to RealmDB
    /// If Word objects already exist in the RealmDB, Word Objects will not be generated anymore
    class func saveWordsFromPlist() {
        guard !RealmManager.shared.hasObjects(Word.self) else {
            print("DEBUG: Words from plist already in DB. ")
            return
        }
        
        // Retrieve plist path if file is available
        guard let plistURL = Bundle.main.url(forResource: "Words", withExtension: "plist") else {
            fatalError("DEBUG: Words.plist not found")
        }

        // Read data of plist as a Dictionary of Strings
        guard let plistData = try? Data(contentsOf: plistURL),
              let plistObject = try? PropertyListSerialization.propertyList(from: plistData, format: nil),
              let dictionary = plistObject as? [String: String] else {
            fatalError("DEBUG: Error reading plist file")
        }
        
        // Loop through the dictionary to create Word objects then save it to RealmDB
        for (key, value) in dictionary {
            let word = Word()
            word._id = key
            word.wordLyric = value
            RealmManager.shared.addObject(word)
        }
        
        print("DEBUG: Words Saved")
    }
    
}
