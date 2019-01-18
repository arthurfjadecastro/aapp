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

//Pin fake Tagua
fileprivate let pin1 = Pin(name: "fake01", latitude: -15.83616738, longitude: -48.05389939)
//Pin fake luziania
fileprivate let pin2 = Pin(name: "fake02", latitude: -16.25940154, longitude: -47.94953618)
//Pin fake Tagua
let pin3 = Pin(name: "fake03", latitude: -15.86562992, longitude: -48.02961393)


///Class responsible for managing the data of the registered pins
class PinDataSource {
    ///Method responsible for create pins
    func pins(completion: @escaping (Result<[Pin]>) -> Void){
        let pins = [pin1,pin2,pin3]
        completion(Result.success(pins))
        // Errorsóaceita
        //completion(Result.error(FileError.fileNotFound))
    }
    
    

    
}



