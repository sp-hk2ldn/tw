//
//  MainCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit

final class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let welcomeCoordinator = WelcomeCoordinator(navigationController: navigationController)
        welcomeCoordinator.parentCoordinator = self
        welcomeCoordinator.start()
    }
    
    func navigateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
    }    
}

extension MainCoordinator {
    func showError(error: APIError) {
        navigationController.children.first?
            .showGenericAlert(with: error.localizedDescription, message: error.localizedDescription)
    }
}
