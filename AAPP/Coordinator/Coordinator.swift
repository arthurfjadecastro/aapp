//
//  Coordinator.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinable {
    var rootViewController: UIViewController? {get set}
    var currentController: UIViewController? {get set}
    
    func present(_ screen: Screen)
    
    
}



class Coordinator: Coordinable {
    
    
    var rootViewController: UIViewController? {
        didSet{
            if (oldValue == nil) {
                self.currentController = self.rootViewController
            }
        }
    }
    
    var currentController: UIViewController?
    
    func present(_ screen: Screen) {
        
    }
    
    
}
