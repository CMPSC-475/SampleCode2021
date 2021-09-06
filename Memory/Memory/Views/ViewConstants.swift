//
//  ViewConstants.swift
//  Simon
//
//  Created by jjh9 on 8/29/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

extension Color {
        static var darkYellow : Color = Color(UIColor.orange)
}
struct ViewConstants {
    
    static let notPlayingBackgroundColor = Color.gray.opacity(0.70)
    static let memorizingBackgroundColor = Color.purple.opacity(0.70)
    static let guessingBackgroundColor = Color.darkYellow.opacity(0.70)
    static let lostBackgroundColor = Color.red.opacity(0.70)
    static let wonBackgroundColor = Color.green.opacity(0.70)
    
    static let buttonColorEnabled: Color = Color.white.opacity(0.40)
    static let buttonColorDisabled: Color = Color.white.opacity(0.15)
    
    static let buttonCornerRadius: CGFloat = 15.0
    static let shadowRadius: CGFloat = 20.0
}
