//
//  DashboardViewController.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController, Storyboarded {
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewModel?.getReport()
    }
}
