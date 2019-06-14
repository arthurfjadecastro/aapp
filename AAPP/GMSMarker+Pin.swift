//
//  GMSMarker+Pin.swift
//  AAPP
//
//  Created by Arthur Castro on 28/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps


extension GMSMarker {
    
    ///Initializer Pin with coordinate2D, position and name.
    convenience init(pin: Pin) {
        let coordinate2d = CLLocationCoordinate2D(coordinate: pin.location)
        self.init(position: coordinate2d)
        self.title = pin.name
        self.icon = UIImage(named: "marker1")
    }
    
    ///Method responsible for convert GMSMarker in Pin
    func asPin() -> Pin {
        return Pin(marker: self)
    }
}
