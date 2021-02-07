//
//  TabBarCoordinator.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: MainCoordinator?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let dashboardNavigationController = UINavigationController()
        let dashboardItem = UITabBarItem(title: "Dashboard", image: .actions, tag: 0)
        dashboardNavigationController.tabBarItem = dashboardItem

        let dashboardCoordinator = DashboardCoordinator(navigationController: dashboardNavigationController)
        
        let reportNavigationController = UINavigationController()
        reportNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let reportCoordinator = ProfileCoordinator(navigationController: reportNavigationController)
        
        tabBarController.viewControllers = [dashboardNavigationController, reportNavigationController]
        
        dashboardCoordinator.start()
        reportCoordinator.start()
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)

    }
    
    
}
