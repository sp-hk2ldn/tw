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
    dynamic var stars: Int = 0
    dynamic var watchers: Int = 0
    dynamic var hasWiki: Bool = false
    dynamic var openIssues: Int = 0
    
    override static func primaryKey() -> String {
        return "repoId"
    }
    
    convenience init(repoId: Int, name: String, repoDescription: String?, fork: Bool, url: String, owner: User?, stars: Int, watchers: Int, hasWiki: Bool, openIssues: Int) {
        self.init()
        self.repoId = repoId
        self.name = name
        self.repoDescription = repoDescription
        self.fork = fork
        self.url = url
        self.owner = owner
        self.stars = stars
        self.watchers = watchers
        self.hasWiki = hasWiki
        self.openIssues = openIssues
    }
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case repoId = "id"
        case name
        case repoDescription = "description"
        case fork, url
        case owner
        case stars = "stargazers_count"
        case watchers
        case hasWiki = "has_wiki"
        case openIssues = "open_issues"
    }
}
