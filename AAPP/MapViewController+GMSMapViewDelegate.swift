//
//  MapViewController+GMSMapViewDelegate.swift
//  AAPP
//
//  Created by Arthur Castro on 27/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        return true
    }
    
}
