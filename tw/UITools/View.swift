//
//  View.swift
//  qn
//
//  Created by Stephen Parker on 1/2/2021.
//

import UIKit

class CircleView: UIView {
    override func draw(_ rect: CGRect) {
        UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).fill()
    }
}
