//
//  RealmClient.swift
//  tw
//
//  Created by Stephen Parker on 6/2/2021.
//

import Foundation
import RealmSwift

class RealmClient: RealmProtocol {
    
    func count(_ type: Object.Type) -> Int {
        guard let realm = try? Realm() else { return 0 }
        return realm.objects(type).count
    }
    
    func saveObjects<T>(_ objects: [T], override: Bool) where T: Object {
        if let realm = try? Realm() {
            try? realm.write {
                realm.add(objects, update: .all)
            }
        }

    }
    
    func saveObject<T>(_ object: T, override: Bool) where T: Object {
        if let realm = try? Realm() {
            try? realm.write {
                realm.add(object, update: .all)
            }
        }
    }
    
    func fetchObjects(_ type: Object.Type) -> [Object]? {
        guard let realm = try? Realm() else { return nil }
        let results = realm.objects(type)
        return Array(results)
    }
    
    func fetchWithPrimaryKey(_ type: Object.Type, primaryKey: String) -> Object? {
        guard let realm = try? Realm() else { return nil }
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }

    
    func fetchWithFilter<T>(_ predicate: NSPredicate) -> [T]? where T: Object {
        guard let realm = try? Realm() else { return nil }
        return Array(realm.objects(T.self).filter(predicate))
    }
}
