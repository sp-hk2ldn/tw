//
//  DashboardCoordinator.swift
//  qn
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
        let viewModel = DashboardViewModel(reportService: ReportService())
        let vc = DashboardViewController.instantiate(sb: "Dashboard")
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
