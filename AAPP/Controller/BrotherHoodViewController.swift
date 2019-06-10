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
    
    var brotherHood: BrotherHoodDetailModel?
    
    
    
    //MARK: - IBO
    ///Outlet responsible for presentation preview details of BrotherHood
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var groupName: UILabel!
    
    
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.addShadowPopUpView()
        guard let _brotherHood = self.brotherHood else {
            return
        }
        self.groupName.text = _brotherHood.Grupo
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentBackground()
    }
    
    //MARK: - IBA    
    ///
    @IBAction func moreDetailsBrotherHood(_ sender: UIButton) {
        
        
        self.coordinator?.present(.brotherHoodDetails, beforePresenting: { (controller) in
            if let _nextController = controller as? BrotherHoodDetailsViewController {
                _nextController.brotherHood = self.brotherHood
            }
            
        });
       
        
    }
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    ///
    @IBAction func sharedBrotherHood(_ sender: UIButton) {print("shared")}
    
    ///
    @IBAction func callBrotherHood(_ sender: UIButton) {
        guard let phone = self.brotherHood?.telefones.description else {return}
        self.callNumber(phoneNumber: phone)
        
    }

    ///
    @IBAction func routeBrotherHood(_ sender: UIButton){print("route")}
    
    
    ///Action call when there is need to go to Map Screen.
    @IBAction func goToMap(_ sender: Any) {
        self.dismissBackground {
            self.coordinator?.dismiss(nil)
        }
    }
    
    
    
    
    
    //MARK: - API
    
    
    
    
    //MARK: - Helper Methods
    
    
    
    private func dismissBackground(_ completion: @escaping ()-> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundView.alpha = 0
        }, completion: { _ in
            completion()
        })
    }
    
    private func presentBackground() {
        self.backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundView.alpha = 0
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.45, delay: 0, options: .curveEaseInOut, animations: {
            self.backgroundView.alpha = 0.2
        }, completion: nil)
    }
    
    
    ///Method responsible for adding shadow in pop up
    private func addShadowPopUpView(){
        self.popUpView.createShadowLayerWith(color: K.BottomCustomShadow.colorShadow, opacity: K.BottomCustomShadow.opacity, offset: K.BottomCustomShadow.offset, radius: K.BottomCustomShadow.radius)
        self.popUpView.createShadowLayerWith(color: K.TopCustomShadow.colorShadow, opacity: K.TopCustomShadow.opacity, offset: K.TopCustomShadow.offset, radius: K.TopCustomShadow.radius)
    }
    
}
