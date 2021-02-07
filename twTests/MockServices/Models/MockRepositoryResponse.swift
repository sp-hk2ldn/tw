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
        let fakeUser = User(login: "octocat", name: "Mr Octocat", location: "The Sea", followers: 3500, following: 0)
        repos = [
            Repository(
                repoId: 12345,
                name: "Swift",
                repoDescription: "A little programming language",
                fork: false,
                url: "https://github.com/octocat/swift",
                owner: fakeUser,
                stars: 10000,
                watchers: 5000,
                hasWiki: true,
                openIssues: 56),
            Repository(
                repoId: 123456,
                name: "Firefox",
                repoDescription: "A little web browser project",
                fork: false,
                url: "https://github.com/octocat/FireFox",
                owner: fakeUser,
                stars: 5000,
                watchers: 400,
                hasWiki: true,
                openIssues: 23)
        ]
    }
    func getMockRespositoryResponse() -> AnyPublisher<[Repository], APIError> {
        return $repos.mapError { APIError(error: $0) }.eraseToAnyPublisher()
    }
}
