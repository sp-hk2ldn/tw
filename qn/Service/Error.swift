//
//  Error.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

enum APIError: Error {
    case badURL
    case notFound
    case notAuthorized
    case generic

    init(error: Error) {
        switch error.localizedDescription {
        default:
            self = .generic
        }
    }
}
