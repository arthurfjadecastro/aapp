//
//  EntityViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

class BrotherHoodViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    //MARK: - IBO
    @IBOutlet weak var popUpView: UIView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.addShadowPopUpView()
    }
    
    
    
    
    
    //MARK: - IBA
    
    ///
    @IBAction func moreDetailsBrotherHood(_ sender: UIButton) {print("moredetail")}
    
    ///
    @IBAction func sharedBrotherHood(_ sender: UIButton) {print("shared")}
    
    ///
    @IBAction func callBrotherHood(_ sender: UIButton) {print("call")}
    
    
    ///
    @IBAction func routeBrotherHood(_ sender: UIButton){print("route")}
    
    
    ///
    @IBAction func goToMap(_ sender: Any) {
        self.coordinator?.dismiss()
    }
    
    
    
    //MARK: - API
    
    
    
    
    //MARK: - Helper Methods
    private func addShadowPopUpView(){
        self.popUpView.createShadowLayerWith(color: K.BottomCustomShadow.colorShadow, opacity: K.BottomCustomShadow.opacity, offset: K.BottomCustomShadow.offset, radius: K.BottomCustomShadow.radius)
        self.popUpView.createShadowLayerWith(color: K.TopCustomShadow.colorShadow, opacity: K.TopCustomShadow.opacity, offset: K.TopCustomShadow.offset, radius: K.TopCustomShadow.radius)
    }
    
}
