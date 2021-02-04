//
//  DashboardViewController.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repositoryCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    
    var viewModel: DashboardViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.retrieveUIData { [weak self] in self?.setupView() }
    }
    
    func setupView() {
        locationLabel.text = viewModel?.location
        usernameLabel.text = viewModel?.username
        followerCountLabel.text = viewModel?.followers
        followingCountLabel.text = viewModel?.following
        repositoryCountLabel.text = viewModel?.repositoryCount
    }
}
