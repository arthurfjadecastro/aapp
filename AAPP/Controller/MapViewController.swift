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

fileprivate let mapStyleFile = File(name: "MapStyle", extension: "json")

class MapViewController: UIViewController, Coordinable {
    
    
    //MARK: - Properties
    ///
    var gps = GPS()
    ///
    private var mapView: GMSMapView?
    ///
    private var camera: GMSCameraPosition?
    ///
    private let pinDataSource = PinDataSource()
    
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    //MARK: - IBO
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        self.setupMap()
        self.setupGPS()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.gps.captureLocation()
        
        
    }
    
    
    //MARK: - IBA
    
    @IBAction func goToEntity(_ sender: Any) {
        self.coordinator?.present(.entity)
    }
    
    
    
    //MARK: - Helper Methods
    
    
    private func setupGPS(){
        self.gps.delegate = self
    }
    
    
    ///
    private func setupMap(){
        let _camera = GMSCameraPosition.camera(withLatitude: -15.83616738, longitude: -48.05389939, zoom: 15.0)
        self.camera = _camera
        
        let _mapView = GMSMapView.map(withFrame: self.view.frame, camera: _camera)
        
        self.mapView = _mapView
        self.setupMapStyle()
        self.fetchPins()
        self.view.addSubview(_mapView)
    }
    
    func fetchPins(){
        guard let _mapView = self.mapView else {
            assertionFailure("There's no map to fetch pins")
            return
        }
        pinDataSource.pins { (result) in
            switch result {
            case .success(let pins):
                let markers = pins.asMarkers()
                markers.forEach({$0.map = _mapView})
            case .error(let error):
                print(error)
            }
        }
    }
    
    func setupMapStyle() {
        guard let _url = Bundle.main.url(mapStyleFile) else {
            assertionFailure("Fail when try find file")
            return
        }
        guard let _styleMap = try? GMSMapStyle(contentsOfFileURL: _url) else {
            assertionFailure("Fail when try initialize stylemap")
            return
        }
        self.mapView?.mapStyle = _styleMap
    }
    
    
    
    
    
    
    
    
}
