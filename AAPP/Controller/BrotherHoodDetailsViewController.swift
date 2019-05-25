//
//  BrotherHoodDetailsViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 06/04/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit


private let dayWeeks = ["Segunda","Terça","Quarta","Quinta","Sexta","Sábado","Domingo","Feriado"]


class BrotherHoodDetailsViewController: UIViewController, Coordinable, UITableViewDataSource, UITableViewDelegate {
    var coordinator: Coordinator?
    
    
    @IBOutlet weak var tableViewDetails: UITableView!
    private var data: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...8 {
            data.append("\(i)")
        }
        
        self.tableViewDetails.dataSource = self
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
