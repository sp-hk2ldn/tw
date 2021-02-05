//
//  MockRepositoryResponse.swift
//  twTests
//
//  Created by Stephen Parker on 4/2/2021.
//

@testable import tw
import Foundation
import Combine

class MockRepositoryResponse {
    @Published var repos: [Repository]
    init() {
        repos = [
            Repository(name: "Swift", description: "A little programming language", fork: false, url: "https://github.com/octocat/swift"),
            Repository(name: "Firefox", description: "A little web browser project", fork: false, url: "https://github.com/octocat/FireFox")
        ]
    }
    func getMockRespositoryResponse() -> AnyPublisher<[Repository], APIError> {
        return $repos.mapError { APIError(error: $0) }.eraseToAnyPublisher()
    }
}
