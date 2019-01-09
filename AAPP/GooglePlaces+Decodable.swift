//
//  GooglePlace+Decodable.swift
//  AAPP
//
//  Created by Arthur Castro on 09/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation

enum GooglePlaceKeys: CodingKey {
    case geometry
    case name
}


extension GooglePlace: Decodable {
    
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: GooglePlaceKeys.self)
        
        struct Location:Decodable {
            let latitude: Double
            let longitude: Double
        }
        
        struct Geometry:Decodable {
            let location: Location
            
            enum GeometryKeys: CodingKey {
                case location
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: GeometryKeys.self)
                self.location = try values.decode(Location.self, forKey: .location)
            }
        }
        
       enum GooglePlaceKeys: CodingKey {
            case geometry
            case name
        }
        
        
        
        
        let _geometry = try values.decode(Geometry.self, forKey: .geometry)
        let _coordinate = Coordinate(latitude: _geometry.location.latitude, longitude: _geometry.location.longitude)
        self.name = try values.decode(String.self, forKey: .name)
        self.location = _coordinate
        
        
    }
    
    
}
