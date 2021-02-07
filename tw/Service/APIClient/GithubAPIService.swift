//
//  GithubAPIService.swift
//  tw
//
//  Created by Stephen Parker on 5/2/2021.
//

import Foundation

enum HTTPMethod {
    case get
}

protocol APIServiceDetails {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

enum GithubAPIService {
    case user(username: String)
    case repos(username: String)
}

extension GithubAPIService: APIServiceDetails {
    
    var baseURL: URL {
        switch self {
        default:
            return AppConfig().baseURL()
        }
    }
    
    var path: String {
        switch self {
        case .user(let username):
            return "/users/\(username)"
        case .repos(let username):
            return "/users/\(username)/repos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}
