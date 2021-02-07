//
//  DashboardCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

class DashboardCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let viewModel = DashboardViewModel(userService: UserService(realmClient: RealmClient()), coordinator: self)
        let dashboardVC = DashboardViewController.instantiate(storyboard: "Dashboard")
        dashboardVC.viewModel = viewModel
        navigationController.pushViewController(dashboardVC, animated: true)
    }
    
    func navigateToDetail(repository: Repository) {
        let repositoryCoordinator = RepositoryDetailCoordinator(navigationController: navigationController, repository: repository)
        childCoordinators.append(repositoryCoordinator)
        repositoryCoordinator.start()
    }
    
    
}
