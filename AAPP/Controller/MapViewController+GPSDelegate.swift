//
//  MapViewController+GPSDelegate.swift
//  AAPP
//
//  Created by Arthur Castro on 25/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation


extension MapViewController: GPSDelegate {
    
    func gps(_ gps: GPS,didUpdate location: Location) {
        print(location.latitude)
        print(location.longitude) 
    }
}
