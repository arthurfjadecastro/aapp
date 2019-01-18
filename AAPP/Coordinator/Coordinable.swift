//
//  Coordinable.swift
//  AAPP
//
//  Created by Arthur Castro on 27/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation



///Protocol responsible for defining the coordinator that will permeate all project viewcontrollers
protocol Coordinable {
    var coordinator: Coordinator? { get set }
}
