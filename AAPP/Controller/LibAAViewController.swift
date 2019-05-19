//
//  LibAAViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit



//
//  EntityViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

class LibAAViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    
    //MARK: - IBO
    ///Outlet responsible for presentation preview details of BrotherHood
    
   @IBOutlet weak var popUpViewTradition: UIView!
    
    @IBOutlet weak var popUpViewMotivation: UIView!
    
    @IBOutlet weak var alphaBackgroundView: UIView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.addShadowPopUpViewTradition()
        self.addShadowPopUpViewMotivation()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentBackground()
    }
    
    //MARK: - IBA
    ///
    @IBAction func moreDetailsTradition(_ sender: UIButton) {
        
//        self.coordinator?.present(.brotherHoodDetails)
        print("moredetail tradition")
        
    }
    
    @IBAction func moreDetailsMotivational(_ sender: UIButton) {
        
        //        self.coordinator?.present(.brotherHoodDetails)
        print("moredetail motivational")
        
    }
    
  
    
    ///Action call when there is need to go to Map Screen.
    @IBAction func goToMap(_ sender: Any) {
        self.dismissBackground {
            self.coordinator?.dismiss()
        }
    }
    
    
    
    //MARK: - API
    
    
    
    
    //MARK: - Helper Methods
    
    
    
    private func dismissBackground(_ completion: @escaping ()-> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
            self.alphaBackgroundView.alpha = 0
        }, completion: { _ in
            completion()
        })
    }
    
    private func presentBackground() {
        self.alphaBackgroundView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.alphaBackgroundView.alpha = 0
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.45, delay: 0, options: .curveEaseInOut, animations: {
            self.alphaBackgroundView.alpha = 0.2
        }, completion: nil)
    }
    
    
    ///Method responsible for adding shadow in pop up
    private func addShadowPopUpViewTradition(){
        self.popUpViewTradition.createShadowLayerWith(color: K.BottomCustomShadow.colorShadow, opacity: K.BottomCustomShadow.opacity, offset: K.BottomCustomShadow.offset, radius: K.BottomCustomShadow.radius)
        self.popUpViewTradition.createShadowLayerWith(color: K.TopCustomShadow.colorShadow, opacity: K.TopCustomShadow.opacity, offset: K.TopCustomShadow.offset, radius: K.TopCustomShadow.radius)
    }
    
    private func addShadowPopUpViewMotivation(){
        self.popUpViewMotivation.createShadowLayerWith(color: K.BottomCustomShadow.colorShadow, opacity: K.BottomCustomShadow.opacity, offset: K.BottomCustomShadow.offset, radius: K.BottomCustomShadow.radius)
        self.popUpViewMotivation.createShadowLayerWith(color: K.TopCustomShadow.colorShadow, opacity: K.TopCustomShadow.opacity, offset: K.TopCustomShadow.offset, radius: K.TopCustomShadow.radius)
    }
    
}
