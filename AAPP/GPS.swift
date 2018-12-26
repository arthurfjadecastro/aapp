//
//  GPS.swift
//  AAPP
//
//  Created by Arthur Castro on 25/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation


class GPS {
    
    var delegate: GPSDelegate?
    
    
    
    
    func captureLocation(){
        self.delegate?.gps(self, didUpdate: pin3.location)
    }
    
}
