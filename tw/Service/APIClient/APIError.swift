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
    case internetOffline
}

extension APIError {
    
    init(error: Error) {
        switch error.localizedDescription {
        case Constants.shared.notFoundFailure:
            self = .notFound
        case Constants.shared.internetFailure:
            self = .internetOffline
        case Constants.shared.decodeFailure, Constants.shared.unexpectedData:
            self = .decodeFailure
        default:
            self = .badURL
        }
    }
}
