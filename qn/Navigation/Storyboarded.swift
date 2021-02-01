//
//  Storyboarded.swift
//  qn
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit

// swiftlint:disable all
protocol Storyboarded {
    static func instantiate(storyboard: String) -> Self
}


extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: String) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
