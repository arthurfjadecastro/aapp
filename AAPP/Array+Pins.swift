//
//  Array+Pins.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps


extension Array where Element == GMSMarker {
    
    func asPins() -> [Pin] {
        return self.map({Pin(marker: $0)})
    }

    
}
