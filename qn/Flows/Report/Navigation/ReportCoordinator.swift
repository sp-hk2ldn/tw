//
//  ReportCoordinator.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

class ReportCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ReportViewModel()
        let reportVC = ReportViewController.instantiate(storyboard: "Report")
        reportVC.viewModel = viewModel
        navigationController.pushViewController(reportVC, animated: true)
    }
    
    
}
