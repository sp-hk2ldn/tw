//
//  WelcomeCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

class WelcomeCoordinator: Coordinator {    
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = WelcomeViewModel(coordinator: self, userService: UserService(realmClient: RealmClient()))
        let welcomeVC = WelcomeViewController.instantiate(storyboard: "Welcome")
        welcomeVC.viewModel = viewModel
        navigationController.pushViewController(welcomeVC, animated: true)
    }
    
    func navigateToTabBar() {
        parentCoordinator?.navigateToTabBar()
    }    
}
