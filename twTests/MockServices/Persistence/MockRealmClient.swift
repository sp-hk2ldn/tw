//
//  MockRealmClient.swift
//  twTests
//
//  Created by Stephen Parker on 6/2/2021.
//

@testable import tw
import Foundation
import RealmSwift

class MockRealmClient: RealmProtocol {
    
    func saveObjects<T>(_ objects: [T], override: Bool) where T: Object {
        // MARK: Not implemented
    }
    
    func saveObject<T>(_ object: T, override: Bool) where T: Object {
        // MARK: Not implemented
    }
    
    func fetchObjects(_ type: Object.Type) -> [Object]? {
        // MARK: Not implemented
        return nil
    }
    
    func fetchWithFilter<T>(_ predicate: NSPredicate) -> [T]? where T: Object {
        // MARK: Not implemented
        return []
    }
    
    func fetchWithPrimaryKey(_ type: Object.Type, primaryKey: String) -> Object? {
        return nil
    }
    
    func updateObject(_ completion: (() -> Void)) {
        // MARK: Not implemented
    }
    
    func count(_ type: Object.Type) -> Int {
        // MARK: Not implemented
        return 0
    }
    
}
