//
//  WelcomeCoordinator.swift
//  qn
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
        let viewModel = WelcomeViewModel(coordinator: self)
        let vc = WelcomeViewController.instantiate(sb: "Welcome")
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToTabBar() {
        parentCoordinator?.navigateToTabBar()
    }    
}
