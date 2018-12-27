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
    
    func gps(_ gps: GPS, didUpdate location: Coordinate) {
        let _location = CLLocationCoordinate2D(coordinate: location)
        let _camera = GMSCameraPosition.camera(withTarget: _location , zoom: 15)
        self.mapViewController?.mapView?.camera = _camera
        //print(self.mapViewController?.mapView?.myLocation?.coordinate)
        //print("aeae\(_location)")
    }
    
    
}
