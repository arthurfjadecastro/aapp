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
    let location: Location
    
    ///Initializer of a pin with name and location
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
    ///Initializer of a pin with name, latitude and longitude
    init(name: String, latitude: Double, longitude: Double) {
        let location = Location(latitude: latitude, longitude: longitude)
        self.init(name: name, location: location)
    }
}




extension Pin {
    ///Initializer of marker with name and location
    init(marker: GMSMarker) {
        self.name = marker.title ?? "Desconhecido"
        self.location = Location(location: marker.position)
    }
}


extension GMSMarker {
   
    ///Initializer Pin with coordinate2D, position and name.
    convenience init(pin: Pin) {
        let coordinate2d = CLLocationCoordinate2D(location: pin.location)
        self.init(position: coordinate2d)
        self.title = pin.name
    }
    
}
