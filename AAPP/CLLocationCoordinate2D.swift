//
//  CLLocationCoordinate2D.swift
//  AAPP
//
//  Created by Arthur Castro on 27/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    ///Intializer location contains latitude and longitude
    init(coordinate: Coordinate) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    ///
    func asCoordinate() -> Coordinate {
        return Coordinate(clCoordinate: self)
    }
}
