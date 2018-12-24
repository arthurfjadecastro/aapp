//
//  Mapview.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

fileprivate let mapStyleFile = File(name: "MapStyle", extension: "json")


class MapView: GMSMapView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupMapStyle()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMapStyle() {
        guard let _url = Bundle.main.url(mapStyleFile) else {
            assertionFailure("Fail when try find file")
            return
        }
        guard let _styleMap = try? GMSMapStyle(contentsOfFileURL: _url) else {
            assertionFailure("Fail when try initialize stylemap")
            return
        }
        self.mapStyle = _styleMap
        
        
        
        
        
    }
    
    
}
