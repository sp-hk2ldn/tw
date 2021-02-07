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
            Repository(repoId: 12345, name: "Swift", repoDescription: "A little programming language", fork: false, url: "https://github.com/octocat/swift", owner: nil),
            Repository(repoId: 123456, name: "Firefox", repoDescription: "A little web browser project", fork: false, url: "https://github.com/octocat/FireFox", owner: nil)
        ]
    }
    func getMockRespositoryResponse() -> AnyPublisher<[Repository], APIError> {
        return $repos.mapError { APIError(error: $0) }.eraseToAnyPublisher()
    }
}
