//
//  UIColor+Random.swift
//  Kit
//
//  Created by jjh9 on 11/30/21.
//

import UIKit

extension UIColor {
    
    static var randomColor : UIColor {return UIColor(
        red: CGFloat.random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1),
        alpha: 1.0 
       )}
    
}
