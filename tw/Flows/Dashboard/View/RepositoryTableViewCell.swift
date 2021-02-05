//
//  RepositoryTableViewCell.swift
//  tw
//
//  Created by Stephen Parker on 4/2/2021.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureCell(with repository: Repository) {
        repositoryNameLabel.text = repository.name
        descriptionLabel.text = repository.description
    }
}
