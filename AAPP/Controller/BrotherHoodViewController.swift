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
    
    @IBOutlet weak var addressPreview: UILabel!
    
    
    //MARK: - IBO
    ///Outlet responsible for presentation preview details of BrotherHood
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var groupName: UILabel!
    
    var addressComplete = String()
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.addShadowPopUpView()
        guard let _brotherHood = self.brotherHood else {
            return
        }
        self.groupName.text = _brotherHood.Grupo
        self.concatPreviewDetails()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentBackground()
    }
    
    func concatPreviewDetails(){
        guard let _brotherHood = self.brotherHood else {
            return
        }
        let semNumero = "s/n"
        if(_brotherHood.numero == semNumero.uppercased() || _brotherHood.numero == semNumero.lowercased() || _brotherHood.numero.isEmpty ){
            
            self.addressComplete = _brotherHood.bairro + " - " + _brotherHood.logradouro + " - " + _brotherHood.complemento
            
        }else {
            self.addressComplete = _brotherHood.bairro + " - " + _brotherHood.logradouro + " - " + _brotherHood.complemento + " Nº "  + _brotherHood.numero
        }
        self.addressPreview.text = self.addressComplete
        
        
    }
    
    //MARK: - IBA    
    ///
    @IBAction func moreDetailsBrotherHood(_ sender: UIButton) {
        
        
        self.coordinator?.present(.brotherHoodDetails, beforePresenting: { (controller) in
            if let _nextController = controller as? BrotherHoodDetailsViewController {
                _nextController.brotherHood = self.brotherHood
                _nextController.completeAddress = self.addressComplete
            }
            
        });
       
        
    }
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\("61996986266")") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    ///
    @IBAction func sharedBrotherHood(_ sender: UIButton) {
        if let sharedText = self.buildShareText() {
            let act = UIActivityViewController(activityItems: [sharedText], applicationActivities: nil)
            act.popoverPresentationController?.sourceView = self.view
            self.present(act, animated: true, completion: nil)
        }
        
    }
    
  
    
    func buildShareText() -> String? {
        guard let _brotherHood = self.brotherHood else {
            return nil
        }
        
        var text = ("Nome: \(_brotherHood.Grupo) \nEndereço: \(self.addressComplete) \n\nReuniões:\n")
        if(_brotherHood.reunioes_2a.trimmingCharacters(in: .whitespaces) != "") {
            text += "Segunda: " + _brotherHood.reunioes_2a + "\n"
        }
        if(_brotherHood.reunioes_3a.trimmingCharacters(in: .whitespaces) != "") {
            text += "Terça: " + _brotherHood.reunioes_3a + "\n"
        }
        if(_brotherHood.reunioes_4a.trimmingCharacters(in: .whitespaces) != "") {
            text += "Quarta: " + _brotherHood.reunioes_4a + "\n"
        }
        if(_brotherHood.reunioes_5a.trimmingCharacters(in: .whitespaces) != "") {
            text += "Quinta: " + _brotherHood.reunioes_5a + "\n"
        }
        if(_brotherHood.reunioes6a.trimmingCharacters(in: .whitespaces) != "") {
            text += "Sexta: " + _brotherHood.reunioes6a + "\n"
        }
        if(_brotherHood.reunioes_sab.trimmingCharacters(in: .whitespaces) != "") {
            text += "Sábado: " + _brotherHood.reunioes_sab + "\n"
        }
        if(_brotherHood.reunioes_dom.trimmingCharacters(in: .whitespaces) != "") {
            text += "Domingo: " + _brotherHood.reunioes_dom + "\n"
        }
        if(_brotherHood.reunioes_fer.trimmingCharacters(in: .whitespaces) != "") {
            text += "Feriado: " + _brotherHood.reunioes_fer
        }
        return text
    }
    
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
