//
//  Coordinator.swift
//  AAPP
//
//  Created by Arthur Castro on 27/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit


///Protocol that defines necessary elements to create the coordinator
protocol Coordinator {
    
    ///Property responsible for storage current controller
    var currentController: UIViewController {get }
    ///Method responsible for presentation Screen in flow
    func present(_ screen: Screen)
    ///Method responsible for dismiss current screen
    func dismiss()
    ///Initializer current Screen
    init(current: UIViewController)
    
}
