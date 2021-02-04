//
//  DashboardViewController.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import UIKit

final class DashboardViewController: UIViewController, Storyboarded {
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewModel?.getUser(completion: { [weak self] (error) in
            if error != nil {
                self?.showAlert(with: error!)
            } else {
                if self?.viewModel == nil {
                    fatalError("No ViewModel")
                }
                self?.showAlert(with: .generic)
            }
        })
        
    }
}
