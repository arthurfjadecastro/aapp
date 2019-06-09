//
//  BrotherHoodDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 06/04/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit




class BrotherHoodDetailsViewController: UIViewController, Coordinable, UITableViewDataSource, UITableViewDelegate {
    var coordinator: Coordinator?
    
    private var dayWeeks = [String]()

    
    var brotherHood: BrotherHoodDetailModel?
    
    @IBOutlet weak var nameGroup: UILabel!
    
    @IBOutlet weak var tableViewDetails: UITableView!
    private var data: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let brother = self.brotherHood else {return}
        self.nameGroup.text = brother.Grupo
        self.setDataWeek()
        self.tableViewDetails.dataSource = self
    }
    
  
    
    func setDataWeek(){
        guard let _brotherHood = self.brotherHood else  {return}
        if(_brotherHood.reunioes_2a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_2a)
        }
        if(_brotherHood.reunioes_3a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_3a)
        }
        if(_brotherHood.reunioes_4a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_4a)
        }
        if(_brotherHood.reunioes_5a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_5a)
        }
        if(_brotherHood.reunioes6a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes6a)
        }
        if(_brotherHood.reunioes_sab.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_sab)
        }
        if(_brotherHood.reunioes_dom.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_dom)
        }
        if(_brotherHood.reunioes_fer.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(_brotherHood.reunioes_fer)
        }
        
        
    }
    
    
    
    @IBAction func buttonClose(_ sender: Any) {
        self.coordinator?.dismiss()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayWeeks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReuniaoTableViewCell //1.
        
        let textEi = dayWeeks[indexPath.row] //2.
        
        cell.textw = textEi
        
        
        return cell //4.
    }
    
    
}
