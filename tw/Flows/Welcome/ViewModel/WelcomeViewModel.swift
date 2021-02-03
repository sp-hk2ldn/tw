//
//  WelcomeViewModel.swift
//  tw
//
//  Created by Stephen Parker on 29/1/2021.
//

import Foundation

class WelcomeViewModel {
    var coordinator: WelcomeCoordinator
    
    init(coordinator: WelcomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToTabBar() {
        coordinator.navigateToTabBar()
    }
}
