//
//  Requester.swift
//  AAPP
//
//  Created by Arthur Castro on 26/01/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation




protocol Requester {
    static func requestJSON<T>(url: URL, completion: @escaping (Result<T>) -> Void) where T:Decodable
    static func requestJSON<T>(url: URLRequest, completion: @escaping (Result<T>) -> Void) where T:Decodable
    static func requestJSON<T>(fromUrl url: String, completion: @escaping (Result<T>) -> Void) where T:Decodable
    static func request(fromUrl url: String, completion: @escaping (Result<Data>) -> Void)
    static func request(from url: URL, completion: @escaping (Result<Data>) -> Void )
    static func request(from url: URLRequest, completion: @escaping (Result<Data>) -> Void )
}
