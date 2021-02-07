//
//  DashboardViewController.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation
import UIKit
import Combine

class DashboardViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repositoryCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var viewModel: DashboardViewModel?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    func setupBindings() {
        guard let user = viewModel?.$user,
              let repositories = viewModel?.$repositories else {
            return
        }
        user.compactMap { $0?.location ?? "No location specified" }
            .assign(to: \.text, on: locationLabel)
            .store(in: &cancellables)
        user.compactMap { $0?.name ?? "Anon" }
            .assign(to: \.text, on: usernameLabel)
            .store(in: &cancellables)
        user.compactMap { $0?.following }
            .map { String(describing: $0) }
            .assign(to: \.text, on: followingCountLabel)
            .store(in: &cancellables)
        user.compactMap { $0?.followers }
            .map { String(describing: $0) }
            .assign(to: \.text, on: followerCountLabel)
            .store(in: &cancellables)
        repositories.compactMap { $0?.count }
            .map { String(describing: $0) }
            .assign(to: \.text, on: repositoryCountLabel)
            .store(in: &cancellables)
        repositories.receive(on: RunLoop.main).sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &cancellables)
        
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell else { return UITableViewCell() }
        guard let repo = viewModel?.repositories?[indexPath.row] else { return cell }
        cell.configureCell(with: repo)
        return cell
    }
    
    
}
