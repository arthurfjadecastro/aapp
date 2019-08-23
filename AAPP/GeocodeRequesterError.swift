//
//  GeocodingRequesterError.swift
//  AAPP
//
//  Created by Arthur Castro on 23/08/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation

enum GeocodeRequesterError: Error, LocalizedError, CustomStringConvertible, CustomDebugStringConvertible {
    case requestError(Error)
    case multipleErrors([(postalCode: String, address: GeocodeAddress)], [String:Error])
    case decodeError(Error)
    case googlePlacesError(String)
    
    var errorDescription: String? {
        switch self {
        case .requestError(let error):
            return "Error on request: \(error)"
        case .multipleErrors(let errors):
            return "Multiple errors occured: \(errors)"
        case .decodeError(let error):
            return "Error when decoding value: \(error)"
        case .googlePlacesError(let status):
            return "Google error: \(status)"
        }
    }
    
    var description: String {
        return self.errorDescription ?? "Without description. Programming error"
    }
    
    var debugDescription: String {
        return self.errorDescription ?? "without debug description. Programming error"
    }
}
