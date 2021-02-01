//
//  Coordinator.swift
//  qn
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
