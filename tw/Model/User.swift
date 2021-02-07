//
//  User.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation
import RealmSwift

@objcMembers class User: Object, Decodable {
    dynamic var login: String = ""
    dynamic var name: String? = ""
    dynamic var location: String? = ""
    dynamic var followers: Int? = 0
    dynamic var following: Int? = 0
    
    override static func primaryKey() -> String {
        return "login"
    }
    
    convenience init(login: String, name: String, location: String?, followers: Int, following: Int) {
        self.init()
        self.login = login
        self.name = name
        self.location = location
        self.followers = followers
        self.following = following
    }
}
