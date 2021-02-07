//
//  DetailSpecs.swift
//  twTests
//
//  Created by Stephen Parker on 7/2/2021.
//

import Foundation
import Quick
import Nimble
@testable import tw

class DetailSpecs: QuickSpec {
    override func spec() {
        let repo = MockRepositoryResponse().repos.first!
        let navigationController = UINavigationController()
        var detailVC: RepositoryDetailViewController!
        var detailVM: RepositoryDetailViewModel!
        
        beforeEach {
            detailVC = RepositoryDetailViewController.instantiate(storyboard: "RepositoryDetail")
            detailVM = RepositoryDetailViewModel(
                repository: repo,
                coordinator: RepositoryDetailCoordinator(navigationController: navigationController, repository: repo)
            )
            detailVC.viewModel = detailVM
        }
        
        describe("the repository details view") {
            beforeEach {
                _ = detailVC.view
            }
            it("Has a repo description or placeholder") {
                expect(detailVC.repoDescriptionLabel?.text).toEventually(equal("A little programming language"))
            }
            it("Has a repo owner") {
                expect(detailVC.ownerLabel.text).toEventually(equal("octocat"))
            }
            it("Has a star count") {
                expect(detailVC.numStarsLabel.text).toEventually(equal("10000"))
            }
            it("Has a watcher count") {
                expect(detailVC.numWatchersLabel.text).toEventually(equal("5000"))
            }
            it("Has a issues count") {
                expect(detailVC.numIssuesLabel.text).toEventually(equal("56"))
            }
            it("Has a fork status") {
                expect(detailVC.isForkLabel.text).toEventually(equal("No"))
            }
        }
    }
}
