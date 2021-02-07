//
//  Repository.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation
import RealmSwift

@objcMembers class Repository: Object, Decodable {
    dynamic var repoId: Int = 0
    dynamic var name: String = ""
    dynamic var repoDescription: String?
    dynamic var fork: Bool? = false
    dynamic var url: String = ""
    dynamic var owner: User? = User()
    
    override static func primaryKey() -> String {
        return "repoId"
    }
    
    convenience init(repoId: Int, name: String, repoDescription: String?, fork: Bool, url: String, owner: User?) {
        self.init()
        self.repoId = repoId
        self.name = name
        self.repoDescription = repoDescription
        self.fork = fork
        self.url = url
        self.owner = owner
    }
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case repoId = "id"
        case name
        case repoDescription = "description"
        case fork, url
        case owner
    }
}
