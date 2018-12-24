//
//  Location.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let latitude: Double
    let longitude: Double
}


extension Location {
    
    init(location: CLLocationCoordinate2D ) {
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
    

    
}


extension CLLocationCoordinate2D {
    
    init(location: Location) {
        self.init(latitude: location.latitude, longitude: location.longitude)
    }
    
    
}
