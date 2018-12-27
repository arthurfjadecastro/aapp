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
struct Location {
    let latitude: Double
    let longitude: Double
    
    ///Initializer Location with latitude and longitude
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}


extension Location {
    ///Initializer location of type Coordinate2D
    init(location: CLLocationCoordinate2D ) {
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
    

    
}
