//
//  MapViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps


class MapViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    
    ///
    private var mapView: GMSMapView?
    ///
    private var camera: GMSCameraPosition?
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    //MARK: - IBO
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.setupMap()
        
        
    }
    
    
    
    
    
    //MARK: - IBA
    
    @IBAction func goToEntity(_ sender: Any) {
        self.coordinator?.present(.entity)
    }
    
    
    
    //MARK: - Helper Methods
    
    
    ///
    private func setupMap(){
        let _camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        self.camera = _camera
        let _mapView = GMSMapView.map(withFrame: self.view.frame, camera: _camera)
        self.mapView = _mapView
        self.mapView = GMSMapView.map(withFrame: self.view.frame, camera: _camera)
        self.view.addSubview(_mapView)
    }
    
    
    
    
    
    
    
    
}
