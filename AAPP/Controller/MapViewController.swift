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
   
    
    ///Property responsible for being the application map
    var mapView: GMSMapView?
    ///Property responsible for viewing the map camera
    private var camera: GMSCameraPosition?
    ///Property responsible for manipulating pin data
    private let pinDataSource = PinDataSource()
    ///Property responsible for the flow management of the screen
    var coordinator: Coordinator?
    
    
    
    
    //MARK: - IBO
    
    

    //MARK: - Lifecycle
    //Fechado para alteracoes dentro ele
    //Aberto para extensao
    //principio aberto fechado open closed principle
    override func viewDidLoad() {
        self.setupMap()
        //RequestHandler.request(fromUrl: "https://viacep.com.br/ws/01001000/json/")
        PlacesServices.brotherHoods { (pin) in
            print(512)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - IBA
    ///Action call when there is need to go to Brotherhood Screen.
//    @IBAction func goToBrotherHood(_ sender: Any) {
//        self.coordinator?.present(.brotherHood)
//    }
    
    
    
    //MARK: - Helper Methods
    ///Method responsible for initial configuration Map.
    private func setupMap(){
        let _camera = GMSCameraPosition.camera(withLatitude: -15.83616738, longitude: -48.05389939, zoom: 15.0)
        self.camera = _camera
        let _mapView = GMSMapView.map(withFrame: self.view.frame, camera: _camera)
        self.mapView = _mapView
        self.mapView?.delegate = self
        self.mapView?.isMyLocationEnabled = true
        self.setupMapStyle()
        self.fetchPins()
        self.view.addSubview(_mapView)
    }
    ///Method responsible for markers search
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
    ///Method responsible for the visual configuration of the map, from a configuration JSON file.
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


