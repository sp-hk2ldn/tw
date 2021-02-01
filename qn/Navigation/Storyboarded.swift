//
//  Storyboarded.swift
//  qn
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(storyboard: String) -> Self
}
