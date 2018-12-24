//
//  Pin.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps




struct Pin {
    let name: String
    let location: Location
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
    
    init(name: String, latitude: Double, longitude: Double) {
        let location = Location(latitude: latitude, longitude: longitude)
        self.init(name: name, location: location)
    }
}




extension Pin {
    
    init(marker: GMSMarker) {
        
        self.name = marker.title ?? "Desconhecido"
        self.location = Location(location: marker.position)
    }
}


extension GMSMarker {
   
    
    convenience init(pin: Pin) {
        let coordinate2d = CLLocationCoordinate2D(location: pin.location)
        self.init(position: coordinate2d)
        self.title = pin.name
    }
    
}
