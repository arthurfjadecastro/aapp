//
//  Pin.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps




///Struct Pin
struct Pin {
    ///Name a pin
    let name: String
    ///Location a pin
    let location: Coordinate
    
    ///Initializer of a pin with name and location
    init(name: String, location: Coordinate) {
        self.name = name
        self.location = location
    }
    ///Initializer of a pin with name, latitude and longitude
    init(name: String, latitude: Double, longitude: Double) {
        let location = Coordinate(latitude: latitude, longitude: longitude)
        self.init(name: name, location: location)
    }
}







