//
//  User.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation


struct User: Decodable {
    let login: String
    let name: String
    let location: String?
    let followers: Int
    let following: Int
}
