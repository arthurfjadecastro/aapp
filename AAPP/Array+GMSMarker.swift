//
//  Array+GMSMarker.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps
///array extension that looks for Pin-like elements
extension Array where Element == Pin {
    
    ///Method responsible for convert Pin to Mark
    func asMarkers() -> [GMSMarker] {
        return self.map({ $0.asMarker() })
    }
    
    
}
