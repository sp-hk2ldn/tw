//
//  DashboardViewModel.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation

class DashboardViewModel {
    
    private var userService: UserServiceProtocol!
    private var user: User?
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func getUser(completion: @escaping ((APIError?) -> Void)) {
        userService.getUser { [weak self] (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let user):
                self?.user = user
                completion(nil)
            }
        }
    }
}
