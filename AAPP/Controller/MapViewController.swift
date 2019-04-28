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
import WebKit

fileprivate let mapStyleFile = File(name: "MapStyle", extension: "json")




struct BrotherHoodDetailModel: Decodable {
    let uf: String
    let Grupo: String
    let inicio_atividades: String
    let telefones: String
    let logradouro: String
    let numero: String
    let complemento: String
    let bairro: String
    let cep: String
    let reunioes_2a: String
    let reunioes_3a: String
    let reunioes_4a: String
    let reunioes_5a: String
    let reunioes6a: String
    let reunioes_sab: String
    let reunioes_dom: String
    let reunioes_fer: String
    
}

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
    
    @IBOutlet weak var webView: WKWebView!
    

    //MARK: - Lifecycle
    //Fechado para alteracoes dentro ele
    //Aberto para extensao
    //principio aberto fechado open closed principle
    override func viewDidLoad() {
        self.captureDataBrotherHood()
        self.setupMap()
        
        //RequestHandler.request(fromUrl: "https://viacep.com.br/ws/01001000/json/")
//        PlacesServices.brotherHoods { (pin) in
//            print(512)
//        }
    
    }
    
    func captureDataBrotherHood() {
        
        self.webView.navigationDelegate = self
        
        self.webView.isHidden = true
        
        self.webView.configuration.preferences.javaScriptEnabled = true
        self.webView.configuration.userContentController.add(self, name: "handleExtractionComplete")
        
        if let url = URL(string: "https://admaa.aabrasil.org.br/ws/md/index.php?MD=1&AREA=df") {
            let request = URLRequest(url: url)
            self.webView.load(request)
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
    
    
    
    
    func doSomething(elements : [BrotherHoodDetailModel]) {
        print(elements)
    }
    
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




extension MapViewController: WKScriptMessageHandler, WKNavigationDelegate  {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = """
                var ceps = [];

                for (var i = 1; i < document.getElementsByTagName('tr').length; i++) {
                    var current = document.getElementsByTagName('tr')[i].getElementsByTagName('td');
                    ceps.push({
                        uf : current[1].innerText,
                        Grupo: current[5].innerText,
                        inicio_atividades : current[6].innerText,
                        telefones : current[7].innerText,
                        logradouro : current[8].innerText,
                        numero : current[9].innerText,
                        complemento : current[10].innerText,
                        bairro : current[11].innerText,
                        cep: current[12].innerText,
                        reunioes_2a : current[28].innerText,
                        reunioes_3a : current[30].innerText,
                        reunioes_4a : current[32].innerText,
                        reunioes_5a : current[34].innerText,
                        reunioes_6a : current[36].innerText,
                        reunioes_sab : current[38].innerText,
                        reunioes_dom : current[40].innerText,
                        reunioes_fer : current[43].innerText
                    });
                }

                window.webkit.messageHandlers.handleExtractionComplete.postMessage(ceps);
            """
        
        self.webView.evaluateJavaScript(js, completionHandler: { (result, err) in
            if (err != nil) {
                // show error feedback to user.
            }
        })
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        var result = [BrotherHoodDetailModel]()
        
        if let receivedEvents = message.body as? [[String : Any]] {
            for element in receivedEvents {
                
             
                let brotherHood = BrotherHoodDetailModel(uf: element["uf"] as! String, Grupo: element["Grupo"] as! String, inicio_atividades: element["inicio_atividades"] as! String, telefones: element["telefones"] as! String, logradouro: element["logradouro"] as! String, numero: element["numero"] as! String, complemento: element["complemento"] as! String, bairro: element["bairro"] as! String , cep: element["cep"] as! String, reunioes_2a: element["reunioes_2a"] as! String , reunioes_3a: element["reunioes_3a"] as! String , reunioes_4a: element["reunioes_4a"] as! String, reunioes_5a: element["reunioes_5a"] as! String, reunioes6a: element["reunioes_6a"] as! String, reunioes_sab: element["reunioes_sab"] as! String, reunioes_dom: element["reunioes_dom"] as! String, reunioes_fer: element["reunioes_fer"] as! String)
                
                result.append(brotherHood)
                

            }
        }
        
        self.doSomething(elements: result)
    }
    
    
    
}




//                result.append(BrotherHoodDetailModel(uf: element["uf"] as? String ?? "Error",
//                                    Grupo: element["Grupo"] as? String ?? "Error",
//                                    inicio_atividades: element["inicio_atividades"] as? String ?? "Error",
//                                    telefones: element["telefones"] as? String ?? "Error",
//                                    logradouro: element["logradouro"] as? String ?? "Error",
//                                    numero: element["numero"] as? String ?? "Error",
//                                    complemento: element["complemento"] as? String ?? "Error",
//                                    bairro: element["bairro"] as? String ?? "Error",
//                                    cep: element["cep"] as? String ?? "Error",
//                                    reunioes_2a: element["reunioes_2a"] as? String ?? "Error",
//                                    reunioes_3a: element["reunioes_3a"] as? String ?? "Error",
//                                    reunioes_4a: element["reunioes_4a"] as? String ?? "Error",
//                                    reunioes_5a: element["reunioes_5a"] as? String ?? "Error",
//                                    reunioes_6a: element["reunioes_6a"] as? String ?? "Error",
//                                    reunioes_sab: element["reunioes_sab"] as? String ?? "Error",
//                                    reunioes_dom: element["reunioes_dom"] as? String ?? "Error",
//                                    reunioes_fer: element["reunioes_fer"] as? String ?? "Error"))
