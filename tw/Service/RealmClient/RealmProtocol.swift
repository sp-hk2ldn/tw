//
//  RealmProtocol.swift
//  tw
//
//  Created by Stephen Parker on 6/2/2021.
//

import Foundation
import RealmSwift

protocol RealmProtocol {

    func saveObjects<T>(_ objects: [T], override: Bool) where T: Object
    func saveObject<T>(_ object: T, override: Bool) where T: Object

    func fetchObjects(_ type: Object.Type) -> [Object]?
    func fetchWithFilter<T>(_ predicate: NSPredicate) -> [T]? where T: Object
    func fetchWithPrimaryKey(_ type: Object.Type, primaryKey: String) -> Object?
    
    func count(_ type: Object.Type) -> Int
}
