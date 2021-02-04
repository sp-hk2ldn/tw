//
//  Repository.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation

struct Repository: Decodable {
    let name: String
    let description: String?
    let fork: Bool
    let url: String
}
