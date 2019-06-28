//
//  BrotherHoodDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 06/04/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

struct DailyMeeting {
    let day: String
    var hour: String
}


class BrotherHoodDetailsViewController: UIViewController, Coordinable, UITableViewDataSource, UITableViewDelegate {
    var coordinator: Coordinator?
    
    private var dayWeeks = [DailyMeeting]()

    @IBOutlet weak var brotherHoodAddress: UILabel!
    
    var brotherHood: BrotherHoodDetailModel?
    
    var completeAddress = String()
    
    @IBOutlet weak var nameGroup: UILabel!
    
    @IBOutlet weak var tableViewDetails: UITableView!
    private var data: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let brother = self.brotherHood else {return}
        self.nameGroup.text = brother.Grupo
        self.setDataWeek()
        self.brotherHoodAddress.text = self.completeAddress
        self.setupTableview()
    }
    
    func buildShareText() -> String? {
        guard let _brotherHood = self.brotherHood else {
            return nil
        }
        
        var text = ("Nome: \(_brotherHood.Grupo) \nEndereço: \(self.completeAddress) \n\nReuniões:\n")
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
    
  
    
    func setDataWeek(){
        guard let _brotherHood = self.brotherHood else  {return}
        if(_brotherHood.reunioes_2a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Segunda", hour: _brotherHood.reunioes_2a))
        }
        if(_brotherHood.reunioes_3a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Terça", hour: _brotherHood.reunioes_3a))
        }
        if(_brotherHood.reunioes_4a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Quarta", hour: _brotherHood.reunioes_4a))
            
        }
        if(_brotherHood.reunioes_5a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Quinta", hour: _brotherHood.reunioes_5a))
        }
        if(_brotherHood.reunioes6a.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Sexta", hour: _brotherHood.reunioes6a))
        }
        if(_brotherHood.reunioes_sab.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Sábado", hour: _brotherHood.reunioes_sab))
        }
        if(_brotherHood.reunioes_dom.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Domingo", hour: _brotherHood.reunioes_dom))
        }
        if(_brotherHood.reunioes_fer.trimmingCharacters(in: .whitespaces) != "") {
            self.dayWeeks.append(DailyMeeting.init(day: "Feriado", hour: _brotherHood.reunioes_fer))
        }
    }
    
    
    
    @IBAction func buttonClose(_ sender: Any) {
        self.coordinator?.dismiss(nil)
    }
    
    func setupTableview(){
        
        self.tableViewDetails.rowHeight = 100
       self.tableViewDetails.delegate = self
        self.tableViewDetails.dataSource = self
       
        
    }
    
    
    
    @IBAction func shareText(_ sender: Any) {
        if let sharedText = self.buildShareText() {
            let act = UIActivityViewController(activityItems: [sharedText], applicationActivities: nil)
            act.popoverPresentationController?.sourceView = self.view
            self.present(act, animated: true, completion: nil)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayWeeks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ReuniaoTableViewCell //1.
        
        var text = dayWeeks[indexPath.row] //2.
        
        if(text.hour.last?.description == "0"){
            text.hour.append(contentsOf: "h")
        }
        
            
            
        
        cell.dailyMeeting = text
        
        if (self.tableViewDetails.contentSize.height > self.tableViewDetails.frame.size.height) {
            self.tableViewDetails.isScrollEnabled = true
        }
        else {
            self.tableViewDetails.isScrollEnabled = false
        }
        
        return cell //4.
    }
    
    
}
