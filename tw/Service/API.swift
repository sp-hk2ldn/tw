//
//  API.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation

enum HTTPMethod {
    case get
}

protocol APIDetails {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

enum GithubAPI {
    case user(username: String)
    case repos(username: String)
}

extension GithubAPI: APIDetails {
    
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

class API {
    
    static func request<T: Decodable>(api: GithubAPI, returnType: T.Type?, completion: @escaping ((Result<T, APIError>) -> Void)) {
        let baseURL = api.baseURL
        let path = api.path
        guard let url = URL(string: "\(baseURL)\(path)") else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, let response = response as? HTTPURLResponse else {
                    completion(.failure(.unknownError))
                    return
                }
                if let error = response.identifyError() {
                    completion(.failure(error))
                } else {
                    let decoder = JSONDecoder()
                    guard let result = try? decoder.decode(T.self, from: data) else {
                        completion(.failure(APIError.decodeFailure))
                        return
                    }
                    completion(.success(result))
                }
            }
        }.resume()
    }
}
