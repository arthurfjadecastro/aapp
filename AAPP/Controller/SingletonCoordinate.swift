//
//  SingletonCoordinate.swift
//  AAPP
//
//  Created by Arthur Castro on 26/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit


class SingletonCoordinate {
    
    private init() {}
    
    static let shared = SingletonCoordinate()
    
    var indexesGroup =  [Int]()
    
    var lat = [Double]()
    var long = [Double]()
    var brotherHoodsDetails = [BrotherHoodDetailModel]()
    
    
}
