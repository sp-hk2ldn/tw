//
//  DonutChart.swift
//  qn
//
//  Created by Stephen Parker on 1/2/2021.
//

import UIKit

class DonutChartView: UIView {
    
    var creditScore: Int?
    var maxCreditScore: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBorder()
    }
    
    func drawBorder() {
        let arcCenter = CGPoint(x: Int(frame.width) / 2, y: Int(frame.height) / 2)
        let borderPath = drawBorderPath(arcCenter: arcCenter)
        let borderShape = CAShapeLayer()
        borderShape.path = borderPath.cgPath
        borderPath.stroke()
            
        let creditPath = drawCreditPath(arcCenter: arcCenter)
        let creditShape = CAShapeLayer()

        creditShape.path = creditPath.cgPath
        UIColor.systemYellow.setStroke()
        creditPath.stroke()
    }
    
    func drawBorderPath(arcCenter: CGPoint) -> UIBezierPath {
        let radius = (frame.height / 2) - 1
        let startAngle: CGFloat = 0.0
        let endAngle = CGFloat(Double.pi * 2)
        
        let borderPath = UIBezierPath.init(arcCenter: arcCenter,
                                           radius: radius,
                                           startAngle: startAngle,
                                           endAngle: endAngle, clockwise: true)
        return borderPath
    }
    
    func drawCreditPath(arcCenter: CGPoint) -> UIBezierPath {
        let radius = (frame.height / 2) - 10
        let startAngle = CGFloat(Double.pi * 3 / 2)
        let percentageCreditScore = CGFloat(creditScore!) / CGFloat(maxCreditScore!)
        let endAngle: CGFloat = startAngle + ((CGFloat(Double.pi * 2)) * percentageCreditScore)
        let creditPath = UIBezierPath.init(arcCenter: arcCenter,
                                           radius: radius,
                                           startAngle: startAngle,
                                           endAngle: endAngle, clockwise: true)
        return creditPath
    }
}
