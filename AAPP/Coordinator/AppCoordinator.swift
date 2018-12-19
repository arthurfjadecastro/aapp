//
//  Coordinator.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
  
    ///Property responsible for storage current controller
    var currentController: UIViewController {get }
    ///Method responsible for presentation Screen in flow.
    func present(_ screen: Screen)
    ///
    func dismiss()
    
    init(current: UIViewController)
    
}


protocol Coordinable {
    var coordinator: Coordinator? { get set }
}


///Class responsible for the logical flow of application navigation
class AppCoordinator: Coordinator {
    
    let currentController: UIViewController
    
    required init(current: UIViewController) {
        self.currentController = current
    }
    
    func dismiss() {
        self.currentController.dismiss(animated: true, completion: nil)
    }
    
    func present(_ screen: Screen) {
        self.presentController(screen)
    }
    
    static func installCoordinatorOnInitialController(){
        guard var initialController = UIApplication.shared.windows.first?.rootViewController as? (Coordinable & UIViewController)  else {
            assertionFailure("Fail when try find view controller")
            return
        }
        initialController.coordinator = AppCoordinator(current: initialController)
    }
    
    //MARK: - Helper methods

    ///
    fileprivate func presentController(_ screen: Screen) {
        let _storyboard = UIStoryboard(name: screen.storyboard, bundle: nil)
        let _controller = _storyboard.instantiateViewController(withIdentifier: screen.controller)
        guard var _nextViewController = _controller as? (Coordinable & UIViewController) else {
            assertionFailure("Fail when try find view controller")
            return
        }
        let _coordinator = AppCoordinator(current: _nextViewController)
        _nextViewController.coordinator = _coordinator
        self.currentController.present(_nextViewController, animated: true, completion: nil)
    }
}
