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
    ///Property responsible for storage root controller
    var rootViewController: UIViewController? {get set}
    ///Property responsible for storage current controller
    var currentController: UIViewController? {get set}
    ///Method responsible for presentation Screen in flow.
    func present(_ screen: Screen)
    
    
}


///Class responsible for the logical flow of application navigation
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
