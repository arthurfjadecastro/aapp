//
//  BrotherHoodDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 06/04/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit



class BrotherHoodDetailsViewController: UIViewController, Coordinable {
    var coordinator: Coordinator?
    
    
    
    @IBAction func buttonClose(_ sender: Any) {
        self.coordinator?.dismiss()
    }
    
    
    
}
