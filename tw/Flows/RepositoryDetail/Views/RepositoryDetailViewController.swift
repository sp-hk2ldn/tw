//
//  RepositoryDetailViewController.swift
//  tw
//
//  Created by Stephen Parker on 7/2/2021.
//

import Foundation
import UIKit
import Combine

class RepositoryDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: VerticalTopAlignLabel!
    @IBOutlet weak var isForkLabel: UILabel!
    @IBOutlet weak var numStarsLabel: UILabel!
    @IBOutlet weak var hasWikiLabel: UILabel!
    @IBOutlet weak var numWatchersLabel: UILabel!
    @IBOutlet weak var numIssuesLabel: UILabel!
    
    var viewModel: RepositoryDetailViewModel?
    var cancellables = Set<AnyCancellable>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    private func setupBindings() {
        guard let repo = viewModel?.$repository else { return }
        repo.compactMap { $0.owner?.login }
            .assign(to: \.text, on: ownerLabel)
            .store(in: &cancellables)
        repo.map { $0.fork ?? false ? "Yes" : "No" }
            .assign(to: \.text, on: isForkLabel)
            .store(in: &cancellables)
        repo.map { $0.name }
            .assign(to: \.text, on: repoNameLabel)
            .store(in: &cancellables)
        repo.map { $0.repoDescription ?? Constants.shared.noRepoDescription }
            .assign(to: \.text, on: repoDescriptionLabel)
            .store(in: &cancellables)
        repo.map { $0.hasWiki ? "Yes" : "No" }
            .assign(to: \.text, on: hasWikiLabel)
            .store(in: &cancellables)
        repo.map { String($0.stars) }
            .assign(to: \.text, on: numStarsLabel)
            .store(in: &cancellables)
        repo.map { String($0.watchers) }
            .assign(to: \.text, on: numWatchersLabel)
            .store(in: &cancellables)
        repo.map { String($0.openIssues) }
            .assign(to: \.text, on: numIssuesLabel)
            .store(in: &cancellables)
    }

}
