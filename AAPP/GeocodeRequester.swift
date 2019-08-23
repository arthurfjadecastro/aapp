//
//  GeocodingRequester.swift
//  AAPP
//
//  Created by Arthur Castro on 23/08/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation

class GeocodeRequester {
    
    func geocode(postalCodes: [String], completion: @escaping (Swift.Result<[(postalCode: String, address: GeocodeAddress)], GeocodeRequesterError>) -> Void) {
        guard !postalCodes.isEmpty else {
            DispatchQueue.main.async {
                completion(.success([]))
            }
            return 
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let dispatchGroup = DispatchGroup()
            
            var errors = [String:GeocodeRequesterError]()
            var locations = [(postalCode: String, address: GeocodeAddress)]()
            
            postalCodes.forEach { [] (postalCode) in
                dispatchGroup.enter()
                
                self.geocode(postalCode: postalCode, completion: { [] (result) in
                    switch result {
                    case .success(let location):
                        locations.append(location)
                    case .failure(let error):
                        errors[postalCode] = error
                    }
                    dispatchGroup.leave()
                })
            }
            
            dispatchGroup.wait()
            
            if !errors.isEmpty {
                DispatchQueue.main.async {
                   completion(.failure(.multipleErrors(locations, errors)))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.success(locations))
                }
            }
        }
    }
    
    func geocode(postalCode: String, completion: @escaping (Swift.Result<(postalCode: String, address: GeocodeAddress), GeocodeRequesterError>) -> Void) {
        let url = K.Geocoding.url(forPostalCode: postalCode)
        RequestHandler.requestJSON(url: url) { (result: Result<GeocodeResponse>) in
            switch result {
            case .success(let response):
                guard let geocodeAddress = response.results.first else {
                    completion(.failure(.googlePlacesError(response.status)))
                    return
                }
                
                completion(.success((postalCode, geocodeAddress)))
            case .error(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}

private struct GeocodeResponse: Decodable {
    let results: [GeocodeAddress]
    let status: String
    
    private enum CodiingKeys: CodingKey {
        case results
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodiingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        if self.status == "OK" {
            self.results = try container.decode([GeocodeAddress].self, forKey: .results)
        } else {
            self.results = []
        }
    }
}
