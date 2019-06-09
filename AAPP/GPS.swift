//
//  GPS.swift
//  AAPP
//
//  Created by Arthur Castro on 25/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class GPS: NSObject {
    //MARK: - Properties
    ///
    internal var delegate: GPSUpdatesHandler?
    ///
    private let locationManager = CLLocationManager()
    ///
    private lazy var authorizationManager = GPSAuthorizationHandler(gps: self)
    
    //MARK: - API
    ///
    func requestLocation(){
        self.locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
    }
    
    ///
    func notifyLocationDenied() {
        guard let notificationsEnablingUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(notificationsEnablingUrl) {
            //alert msg for user - quando clicar no "botao" - verificar e revisar telas.
            UIApplication.shared.open(notificationsEnablingUrl, options: [:], completionHandler: nil)
        }
    }
    ///
    func captureLocation(){
        self.requestAuthorization()
    }
    
    //MARK: - Helper Methods
    ///
    private func pauseUpdateLocation(){
        self.locationManager.stopUpdatingLocation()
    }
    private func requestAuthorization(){
        self.locationManager.delegate = self.authorizationManager
        self.locationManager.requestWhenInUseAuthorization()
    }
    
}


extension GPS: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first?.coordinate else {
            assertionFailure("Fail when try to get first location")
            return
        }
        
        let _locationUser = Coordinate(clCoordinate:firstLocation)
        //self.pauseUpdateLocation()
        self.delegate?.gps(self, didUpdate: _locationUser)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.pauseUpdateLocation()
        print("Error \(error)")
    }
}
