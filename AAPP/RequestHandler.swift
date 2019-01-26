//
//  HandlerRequest.swift
//  AAPP
//
//  Created by Arthur Castro on 07/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation



class RequestHandler: Requester {

    
    
    //MARK: - Helpers Method
    static func requestJSON<T>(url: URL, completion: @escaping (Result<T>) -> Void) where T:Decodable {
        RequestHandler.requestJSON(url: URLRequest(url: url), completion: completion)
    }
    
    
    
    static func requestJSON<T>(url: URLRequest, completion: @escaping (Result<T>) -> Void) where T:Decodable {
        RequestHandler.request(from: url) { (result) in
            switch result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                do {
                    let json: T = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(json))
                }catch {
                    completion(Result.error(error))
                }
                
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
    static func requestJSON<T>(fromUrl url: String, completion: @escaping (Result<T>) -> Void) where T:Decodable {
        RequestHandler.request(fromUrl: url ) { (result) in
            switch result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                do {
                    let json: T = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(json))
                }catch {
                    completion(Result.error(error))
                }
            case .error(let error):
                completion(Result.error(error))
            }
        }
    }
    
   
    
    static func request(fromUrl url: String, completion: @escaping (Result<Data>) -> Void) {
        if let _url = URL(string: url) {
            
            RequestHandler.request(from: _url, completion: completion)
        }else{
            completion(Result.error(RequestHandlerError.failCreateUrl("Unable to create URL object from String")))
        }
    }
    
    static func request(from url: URL, completion: @escaping (Result<Data>) -> Void ) {
        RequestHandler.request(from: URLRequest(url: url), completion: completion)
    }
    
    
    
    
    class func request(from url: URLRequest, completion: @escaping (Result<Data>) -> Void ){
        URLSession.shared.dataTask(with: url) { (result) in
            switch result {
                case .success(let response):
                    completion(Result.success(response.data))
                case .error(let error):
                    completion(Result.error(error))
            }
        }.resume()
    }
    
    
}


enum RequestHandlerError: Error {
    case failCreateUrl(String)
}
