//
//  PinDataSource.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps


//fileprivate let pin1 = GMSMarker(position: )

class PinDataSource {
    
    func pins(completion: @escaping (Result<[GMSMarker]>) -> Void){
        let pins = [GMSMarker]()
        completion(Result.success(pins))
        // Error
        //completion(Result.error(FileError.fileNotFound))
    }
    
    

    
}



