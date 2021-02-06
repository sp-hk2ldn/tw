//
//  Error.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

enum APIError: Error {
    
    case badURL
    case serverError
    case notFound
    case notAuthorized
    case generic
    case unknownError
    case decodeFailure
}

extension APIError {
    init(error: Error) {
        switch error.localizedDescription {
        default:
            self = .badURL
        }
    }
}
