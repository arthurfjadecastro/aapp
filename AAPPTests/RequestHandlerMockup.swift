//
//  RequestHandlerMockup.swift
//  AAPPTests
//
//  Created by Arthur Castro on 26/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation




class RequestHandlerMockup: RequestHandler {
    
    static var mockup: String?
    
    override class func request(from url: URLRequest, completion: @escaping (Result<Data>) -> Void) {
        guard let data =  self.mockup?.data(using: .utf8) else {
            fatalError("The mockup must be setted before there request method is called")
        }
        completion(Result.success(data))
        
    }
    
}
