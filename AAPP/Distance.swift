//
//  Distance.swift
//  Fraldario
//
//  Created by Gustavo Amaral on 10/12/17.
//  Copyright © 2017 Gustavo Arthur Vollbrecht. All rights reserved.
//

import CoreGraphics

///A distance without information about measure unit; This way, the value can be casted
///to any unit.
struct Distance {
    
    ///The distance's base value.
    private var meters: CGFloat
    
    ///Returns the distance in meters.
    var asMeters: CGFloat {
        return self.meters
    }
    
    ///Returns the distance in kilometers.
    var asKm: CGFloat {
        return self.meters / 1000
    }
    
    ///Creates a distance using `meters`.
    init(meters: Double) {
        self.meters = CGFloat(meters)
    }
    
    ///Creates a distance using `meters`.
    init(meters: CGFloat) {
        self.meters = meters
    }
    
    ///Creates a distance using `km`.
    init(km: CGFloat) {
        self.init(meters: km * 1000)
    }
    
    ///Creates a distance using `km`.
    init(km: Int) {
        self.init(meters: CGFloat(km * 1000))
    }
}

extension Distance: Equatable {
    
    static func ==(lhs: Distance, rhs: Distance) -> Bool {
        return lhs.meters == rhs.meters
    }
}
