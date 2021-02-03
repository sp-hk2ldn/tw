//
//  WelcomeViewController.swift
//  tw
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var welcomeButton: UIButton!
    
    @IBAction func navigateToDashboard(_ sender: UIButton) {
        viewModel?.navigateToTabBar()
    }
    
    var viewModel: WelcomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
