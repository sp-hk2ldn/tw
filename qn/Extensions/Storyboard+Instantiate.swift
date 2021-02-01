//
//  Storyboard+Instantiate.swift
//  qn
//
//  Created by Stephen Parker on 1/2/2021.
//

import Foundation
import UIKit

// swiftlint:disable all
extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: String) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
