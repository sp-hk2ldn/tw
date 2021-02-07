//
//  RepositoryDetailViewModel.swift
//  tw
//
//  Created by Stephen Parker on 7/2/2021.
//

import Foundation
import Combine


class RepositoryDetailViewModel {
    @Published var repository: Repository
    var coordinator: Coordinator
    
    init(repository: Repository, coordinator: Coordinator) {
        self.repository = repository
        self.coordinator = coordinator
    }
}
