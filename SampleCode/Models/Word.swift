//
//  Word.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation
import RealmSwift

/// Contains the word that will be displayed each round.
class Word: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var wordLyric: String
}
