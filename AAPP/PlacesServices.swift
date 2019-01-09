//
//  PlacesServices.swift
//  AAPP
//
//  Created by Arthur Castro on 07/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces





class PlacesServices {
    
    
    //MARK: - Properties
    static let shared = PlacesServices()
    
    
    
    private init() {
    }
    
    
    
    
    //MARK: - API
    
    
    

    
    
    static func brotherHoods(completion: ([Pin]) -> Void) {
        struct GooglePlaces: Decodable {
            let results: [GooglePlace]
            
            enum GooglePlacesKeys: CodingKey {
                case results
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: GooglePlacesKeys.self)
                self.results = try values.decode([GooglePlace].self, forKey: .results)
            }
        }
        guard let nameUrl = URL(string: K.PlacesSearch.endpoint) else {
            assertionFailure("Fail when try get url")
            return
        }
        var _urlRequest = URLRequest(url: nameUrl)
        _urlRequest.addValue(K.PlacesSearch.key, forHTTPHeaderField: "key")
        let _distance = K.PlacesSearch.radius.asMeters
        let _stringDistance = "\(_distance)"
        
        _urlRequest.addValue(_stringDistance, forHTTPHeaderField: "radius")
        
        _urlRequest.addValue("-33.85992227989272,151.2085402201073", forHTTPHeaderField: "location")
        
        RequestHandler.requestJSON(url: _urlRequest) { (result: Result<GooglePlaces>) in
            switch result {
            case .success(let places):
                print(places)
            case .error(let error):
                print(error)
            }
        }
        
        
        
    }
    
    
    
    
}
