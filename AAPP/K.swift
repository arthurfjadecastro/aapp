//
//  K.swift
//  AAPP
//
//  Created by Arthur Castro on 27/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit


struct K {
    
    ///Shadow pattern below in view
    /// - Note: this shadow generates the impression of depth
    struct BottomCustomShadow {
        static let colorShadow = UIColor(red:0.04, green:0.12, blue:0.27, alpha:0.12).cgColor
        static let opacity: Float = 1
        static let offset = CGSize(width: 0, height: 18)
        static let radius: CGFloat = 18
    }
    ///Shadow pattern above in view
    /// - Note: this shadow generates the outline impression of the view
    struct TopCustomShadow {
        static let colorShadow = UIColor(red:0.04, green:0.12, blue:0.27, alpha:0.12).cgColor
        static let opacity: Float = 1
        static let offset = CGSize(width: 0, height: 0)
        static let radius: CGFloat = 1
    }
    
}

