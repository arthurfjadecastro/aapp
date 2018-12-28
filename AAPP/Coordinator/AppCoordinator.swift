//
//  Coordinator.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit



///Class responsible for the logical flow of application navigation
class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    
    ///Current ViewController
    let currentController: UIViewController
    
    //MARK: - Initializers
    
    ///Initizliaze Current Controller
    required init(current: UIViewController) {
        self.currentController = current
    }
    
    //MARK: - API
    
    ///Method responsible for dismiss actual view controller
    func dismiss() {
        self.currentController.dismiss(animated: true, completion: nil)
    }
    
    ///Method responsible for present screen
    func present(_ screen: Screen) {
        self.presentController(screen)
    }
    
    ///method responsible for the initial installation of the coordinator and the viewcontroller
    static func installCoordinatorOnInitialController(){
        ///Capture initial view controller
        guard var initialController = UIApplication.shared.windows.first?.rootViewController as? (Coordinable & UIViewController)  else {
            assertionFailure("Fail when try find view controller")
            return
        }
        initialController.coordinator = AppCoordinator(current: initialController)
    }
    
    //MARK: - Helper methods

    ///Method responsible for implementing the desired view controller presentation
    fileprivate func presentController(_ screen: Screen, transition: ScreenTransition = .popUpIn) {
        let _storyboard = UIStoryboard(name: screen.storyboard, bundle: nil)
        let _controller = _storyboard.instantiateViewController(withIdentifier: screen.controller)
        guard var _nextViewController = _controller as? (Coordinable & UIViewController) else {
            assertionFailure("Fail when try find view controller")
            return
        }
        let _coordinator = AppCoordinator(current: _nextViewController)
        _nextViewController.coordinator = _coordinator
        transition.present(current: self.currentController, next: _nextViewController)
        
    }
}
