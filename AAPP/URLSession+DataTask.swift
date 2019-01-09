//
//  URLSession+DataTask.swift
//  AAPP
//
//  Created by Arthur Castro on 08/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation


struct ResponseSuccess {
    let data: Data
    let urlResponse: URLResponse
}



extension URLSession {
    
    
    @discardableResult
    ///Converter erro de execucao pra tempo de compilacao.
    func dataTask(with urlRequest: URLRequest, completion:@escaping (Result<(data:Data, response:URLResponse)>) -> Void ) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let _error = error {
                completion(Result.error(_error))
                return
            }
            guard let _data = data, let _response = response else {
                fatalError("Fail when try load data and response when error isn't nil")
            }
            let _result: (Data,URLResponse) = (_data, _response)
            completion(Result.success(_result))
        }
    }
    
    
    
    @discardableResult
    ///Converter erro de execucao pra tempo de compilacao.
    func dataTask(with url: URL, completion:@escaping (Result<(data:Data, response:URLResponse)>) -> Void ) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _error = error {
                completion(Result.error(_error))
                return
            }
            guard let _data = data, let _response = response else {
               fatalError("Fail when try load data and response when error isn't nil")
            }
            let _result: (Data,URLResponse) = (_data, _response)
            completion(Result.success(_result))
        }
    }
    
}
