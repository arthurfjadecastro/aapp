//
//  GPSAuthorizationHandler.swift
//  AAPP
//
//  Created by Arthur Castro on 26/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation



class GPSAuthorizationHandler: NSObject, CLLocationManagerDelegate {
    
    //MARK: - Properties
    private weak var gps: GPS?
    
    
    //MARK: - Init
    init(gps: GPS) {
        self.gps = gps
    }
    
    //MARK: - API
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
            self.gps?.requestLocation()
        case .denied,.notDetermined,.restricted:
            self.gps?.notifyLocationDenied()
        default:break
        }
    }
    
    
    
}




