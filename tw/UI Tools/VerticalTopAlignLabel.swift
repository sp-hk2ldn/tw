//
//  VerticalTopAlignLabel.swift
//  tw
//
//  Created by Stephen Parker on 7/2/2021.



import Foundation
import UIKit

///Shamelessly "borrowed" from SO:  https://stackoverflow.com/a/10681299/4803912
class VerticalTopAlignLabel: UILabel {
    override func drawText(in rect: CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }
        let attributedText = NSAttributedString(
            string: labelText,
            attributes: [NSAttributedString.Key.font: font as Any])
        var newRect = rect
        newRect.size.height = attributedText
            .boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height

        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }
        super.drawText(in: newRect)
    }
}
