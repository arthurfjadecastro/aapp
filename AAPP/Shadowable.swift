//
//  UIView+ShadowLayer.swift
//  EquipeRocket
//
//  Created by Arthur Castro on 18/09/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit




extension UIView: ShadowConstraints {
    ///Method responsible for add constraints of equality in conformed a superview.
    func addShadowConstraints(in relation: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: relation.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: relation.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: relation.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: relation.bottomAnchor).isActive = true
    }
    
    
    
    
    ///Method responsible for create custom shadow in view.
    /// - Parameter color: Color in shadow
    /// - Parameter opacity: Value in opacity shadow
    /// - Parameter offset: shadow arrangement in relation to your view
    /// - Parameter radius: shadow blur print control
    func createShadowLayerWith(color: CGColor , opacity: Float, offset: CGSize, radius: CGFloat, cornerRadius: CGFloat? = nil) {
        guard let superview = self.superview else {
            assertionFailure("A view must have a superview to have a shadow")
            return
        }
        //Create ShadowView
        let _shadowView = ShadowView()
        superview.insertSubview(_shadowView, belowSubview: self)
        _shadowView.addShadowConstraints(in: self)
        _shadowView.layer.cornerRadius = cornerRadius ?? self.layer.cornerRadius
        
        //Adding parameterized values
        _shadowView.backgroundColor = .white
        _shadowView.layer.shadowColor = color
        _shadowView.layer.shadowOpacity = opacity
        _shadowView.layer.shadowOffset = offset
        _shadowView.layer.shadowRadius = radius
        
    }
    
    func removeAllShadows() {
        guard let superview = self.superview else {
            assertionFailure("A view must have a superview to have a shadow")
            return
        }
        
        for subview in superview.subviews {
            if subview is ShadowView {
                subview.removeFromSuperview()
            }
        }
    }
}

class ShadowView: UIView {
    
}



