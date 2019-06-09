//
//  MotivationDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 22/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

class MotivationDetailsViewController: UIViewController, Coordinable {
    
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.coordinator?.dismiss(nil)
    }
    
}
