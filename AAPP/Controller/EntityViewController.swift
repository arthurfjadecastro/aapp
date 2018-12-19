//
//  EntityViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

class EntityViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    //MARK: - IBO
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
    }
    
    
    
    
    
    //MARK: - IBA
    
    @IBAction func goToMap(_ sender: Any) {
        self.coordinator?.dismiss()
    }
    
    
    //MARK: - Methods Helper
    
    
}
