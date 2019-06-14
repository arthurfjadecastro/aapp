//
//  LibAAViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

protocol libAAViewControllerDelegate {
    func willDismiss(_ libAA: LibAAViewController)
}


fileprivate let traditionMessages = Messages(title: "12 Passos", image: UIImage(named: "steps")!)
fileprivate let motivationMessages = Messages(title: "12 Tradições", image: UIImage(named: "hand_cursor")!)
fileprivate let revistaVivencia = Messages(title: "Revista Vivência", image: UIImage(named: "book")!)
fileprivate let lojaAA = Messages(title: "Loja AA", image: UIImage(named: "handshake")!)

class LibAAViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    
    var delegate: libAAViewControllerDelegate?
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    var messages = [Messages]()
    
    
    //MARK: - IBO
    ///Outlet responsible for presentation preview details of BrotherHood
    
    
    
     @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBOutlet weak var alphaBackgroundView: UIView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        self.messages.append(contentsOf: [traditionMessages, motivationMessages, revistaVivencia, lojaAA])
        self.setupTableview()
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentBackground()
    }
    
    func setupTableview(){
        let _width = K.LayoutCell.widthInRelationToTableView * tableView.frame.size.width
        let _height = K.LayoutCell.heightInRelationToWidth * _width
        self.tableView.rowHeight = _height
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if (self.tableView.contentSize.height < tableView.frame.size.height) {
            self.tableView.isScrollEnabled = true
        }
        else {
             self.tableView.isScrollEnabled = true
        }
        
    }
    
    //MARK: - IBA
    ///
    @IBAction func moreDetailsTradition(_ sender: UIButton) {
        
        self.coordinator?.present(.libDetails, beforePresenting: nil)
        print("moredetail tradition")
        
    }
    
    @IBAction func moreDetailsMotivational(_ sender: UIButton) {
        
        //        self.coordinator?.present(.brotherHoodDetails)
        print("moredetail motivational")
        
    }
    
  
    
    ///Action call when there is need to go to Map Screen.
    @IBAction func goToMap(_ sender: Any) {
        self.dismissBackground {
            self.coordinator?.dismiss(nil)
            self.delegate?.willDismiss(self)
//            self.coordinator?.dismiss { controller in
//                if let _controller = controller as? MapViewController {
//                    _controller.changeColorIconMap()
//                }
//            }
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

}



extension LibAAViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibCell", for: indexPath)
        if let libCell = cell as? LibCell {
            libCell.img = self.messages[indexPath.row].image
            libCell.title = self.messages[indexPath.row].title
//            libCell.libImage.hero.id = self.messages[indexPath.row].image.description
           
        }
        return cell
    }
}


extension LibAAViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0){
            self.coordinator?.present(.libDetails, beforePresenting: nil)
        }else if (indexPath.row == 1) {
            self.coordinator?.present(.MotivationalDetails, beforePresenting: nil)
        }else if (indexPath.row == 2) {
            if let url = URL(string: "https://www.revistavivencia.org.br/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }else {
            if let url = URL(string: "https://www.aa.org.br/loja/") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        print(indexPath.row)
//        self.coordinator?.present(.libDetails, beforePresenting: { controller in
//            guard let _libDetailsViewController = controller as? LibDetailsViewController else {
//                assertionFailure("The next controller must be of type ListDetailViewController")
//                return
//            }
//            _libDetailsViewController = self.messages[indexPath.row]
//        })
    }
}
