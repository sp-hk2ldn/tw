//
//  IDVStatus.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

enum IDVStatus: String, Decodable  {
    case pass = "PASS"
    case fail = "FAIL"
    case pending = "PENDING"
}
