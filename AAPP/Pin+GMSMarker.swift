//
//  Pin+GMSMarker.swift
//  AAPP
//
//  Created by Arthur Castro on 28/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps


extension Pin {
    ///Initializer of marker with name and location
    init(marker: GMSMarker) {
        self.name = marker.title ?? "Desconhecido"
        self.location = Coordinate(clCoordinate: marker.position)
    }
    
    ///Method responsible for convert Pin in GMSMarker
    func asMarker() -> GMSMarker {
        return GMSMarker(pin: self)
    }
}
