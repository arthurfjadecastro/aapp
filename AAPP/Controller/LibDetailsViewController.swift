//
//  LibDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import Hero


/**

 */
class LibDetailsViewController: UIViewController, Coordinable  {
    
    //MARK: - IBO
    @IBOutlet weak var stespImage: UIImageView!
    @IBOutlet weak var titleImage: UILabel!
    @IBOutlet weak var synopsysLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Properties
    
    ///Movie in the details screen
    var messages: Messages?
    ///Responsible for coordinating the output or input of screens
    var coordinator: Coordinator?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        self.stespImage.hero.id = "setpImage"
     
    }
    
    
    //Dispatch in principal thread
    func performTaskMainQueue(task: @escaping ()-> ()) {
        DispatchQueue.main.async {
            task()
        }
    }
    
  
    
  
    
    ///Action responsible for remove current view controller
    @IBAction func handleBack(_ sender: Any) {
        self.coordinator?.dismiss(nil)
    }
}













