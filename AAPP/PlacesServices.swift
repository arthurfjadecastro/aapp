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

        let _distance = K.PlacesSearch.radius.asMeters
        let _stringDistance = "\(_distance)"
        var urlComponents = URLComponents(string: K.PlacesSearch.endpoint)
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: K.PlacesSearch.key),
            URLQueryItem(name: "radius", value: _stringDistance),
            URLQueryItem(name: "location", value: "-33.85992227989272,151.2085402201073")
        ]
        
        
        
      
     
        
        guard let _url = urlComponents?.url else {
            assertionFailure("Fail when try get specific url")
            return
        }
        
        RequestHandler.request(from: _url) { (result: Result<Data>) in
            switch result {
            case .success(let places):
                let placesString = String(data: places, encoding: .utf8)
               // print(placesString)
                
            case .error(let error):
                print(error)
            }
        }
        ///convert json
        RequestHandler.requestJSON(url: _url) { (result: Result<GooglePlaces>) in
            switch result {
            case .success(let places):
                print(places)
            case .error(let error):
                print(error)
            }
        }
    }
    
    
    
    
}
