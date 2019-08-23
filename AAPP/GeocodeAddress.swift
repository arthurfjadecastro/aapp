//
//  GeocodingAddress.swift
//  AAPP
//
//  Created by Arthur Castro on 23/08/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation

struct GeocodeAddress: Decodable {
    let placeID: String
    let address: String
    let coordinate: Coordinate
    
    private enum CodingKeys: CodingKey {
        case formatted_address
        case place_id
        case geometry
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placeID = try container.decode(String.self, forKey: .place_id)
        self.address = try container.decode(String.self, forKey: .formatted_address)
        let geometry = try container.decode(Geometry.self, forKey: .geometry)
        let latitude = geometry.location.lat
        let longitude = geometry.location.lng
        let coordinate = Coordinate(latitude: latitude, longitude: longitude)
        self.coordinate = coordinate
    }
}

private struct Geometry: Decodable {
    let location: Location
}

private struct Location: Decodable {
    let lat: Double
    let lng: Double
}
