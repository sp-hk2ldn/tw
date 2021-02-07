//
//  RepositoryDetailCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 7/2/2021.
//

import Foundation
import UIKit

class RepositoryDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var repository: Repository
    
    init(navigationController: UINavigationController, repository: Repository) {
        self.navigationController = navigationController
        self.repository = repository
    }
    
    func start() {
        let repositoryDetailVC = RepositoryDetailViewController.instantiate(storyboard: "RepositoryDetail")
        let viewModel = RepositoryDetailViewModel(
            repository: repository, coordinator: self)
        repositoryDetailVC.viewModel = viewModel
        navigationController.pushViewController(repositoryDetailVC, animated: true)
    }
    
    
}
