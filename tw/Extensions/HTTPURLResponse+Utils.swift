//
//  HTTPURLResponse+Utils.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation

extension HTTPURLResponse {
    func identifyError() -> APIError? {
        switch self.statusCode {
        case 401:
            return .notAuthorized
        case 404:
            return .notFound
        case 200..<399:
            return nil
        case 500..<600:
            return .serverError
        default:
            return .generic
        }
    }
}
