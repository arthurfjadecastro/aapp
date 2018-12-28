//
//  Coordinate+CLLocationCoordinate2D.swift
//  AAPP
//
//  Created by Arthur Castro on 28/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation


extension Coordinate {
    ///Initializer location of type Coordinate2D
    init(clCoordinate: CLLocationCoordinate2D ) {
        self.latitude = clCoordinate.latitude
        self.longitude = clCoordinate.longitude
    }
    
    ///Method responsible for convert Coordinate to CLLocationCoordinate2D
    func asCLCoordinate() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(coordinate: self)
    }
    
    
    
}
