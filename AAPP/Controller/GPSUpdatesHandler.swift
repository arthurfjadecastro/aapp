//
//  GPSUpdatesHandler.swift
//  AAPP
//
//  Created by Arthur Castro on 26/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps



struct GPSUpdatesHandler: GPSDelegate {
    
    private weak var mapViewController: MapViewController?
    
    init(mapViewController: MapViewController) {
        self.mapViewController = mapViewController
    }
    
    func gps(_ gps: GPS, didUpdate location: Location) {
        let _location = CLLocationCoordinate2D(location: location)
        let _camera = GMSCameraPosition.camera(withTarget: _location , zoom: 15)
        self.mapViewController?.mapView?.camera = _camera
    }
    
    
}
