//
//  extensions.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/17.
//

import UIKit

extension String {
    
    /// 计算高度与长度的类函数
    static func getTextRectSize(_ text: String, font: UIFont, size: CGSize) -> CGRect {
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect: CGRect = text.boundingRect(with: size, options: option,
                                            attributes: attributes, context: nil)
        return rect
    }
    
}
