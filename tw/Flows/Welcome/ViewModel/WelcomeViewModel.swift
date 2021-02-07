//
//  WelcomeViewModel.swift
//  tw
//
//  Created by Stephen Parker on 29/1/2021.
//

import Foundation
import Combine

//Username validation rules taken from github.com/join

final class WelcomeViewModel {
    var coordinator: WelcomeCoordinator
    var userService: UserService
    
    @Published var usernameEntry = ""
    
    var errorMessage: AnyPublisher<String, Never> {
        usernameValid.map {
            if $0 == false {
                return Constants.shared.messageInvalidUser
            }
            return ""
        }.eraseToAnyPublisher()
    }
    
    var usernameValid: AnyPublisher<Bool, Never> {
        return $usernameEntry
            .map {
                !$0.isEmpty && //must not be empty...
                $0.count < 40 //must be less than 40 chars...
                && CharacterSet.alphanumerics
                    .isSuperset(of: CharacterSet(charactersIn: $0.replacingOccurrences(of: "-", with: ""))) //only accept alphanumerics and...
                && $0.filter { $0 == "-" }.count < 2 //maximum of 1 hyphen...
                && $0.prefix(1) != "-" //which can't be at the beginning...
                && $0.suffix(1) != "-" //or the end!
            }
            .eraseToAnyPublisher()
    }
    
    init(coordinator: WelcomeCoordinator, userService: UserService) {
        self.coordinator = coordinator
        self.userService = userService
    }
    
    func navigateToTabBar() {
        setUsername()
        coordinator.navigateToTabBar()
    }
    
    func setUsername() {
        
        userService.setUsername(username: usernameEntry)
    }
}
