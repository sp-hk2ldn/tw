//
//  ReportCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    //MARK: Not implemented, example only
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProfileViewModel()
        let profileVC = ProfileViewController.instantiate(storyboard: "Profile")
        profileVC.viewModel = viewModel
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    
}
