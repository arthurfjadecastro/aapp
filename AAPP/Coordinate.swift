//
//  Location.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation

///Struct Location
struct Coordinate: Codable {
    let latitude: Double
    var longitude: Double
    
    ///Initializer Location with latitude and longitude
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
}

