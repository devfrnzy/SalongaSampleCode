//
//  RealmManager.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation
import RealmSwift

/// Wrapper for RealmDB methods
/// Handles Database Item insert and retrieval
class RealmManager {
    static let shared = RealmManager()
    private let realm: Realm
    
    private init() {
        // Get the default Realm
        do {
            realm = try Realm()
        } catch {
            fatalError("Error initializing Realm: \(error)")
        }
    }
    
    // MARK: - Add Object to Realm
    
    func addObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Error adding object to Realm: \(error)")
        }
    }
    
    // MARK: - Access Realm Objects
    
    func getAllObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    func hasObjects<T: Object>(_ type: T.Type) -> Bool {
        return getAllObjects(type).count > 0
    }
}
