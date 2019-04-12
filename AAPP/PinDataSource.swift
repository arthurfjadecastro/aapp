//
//  PinDataSource.swift
//  AAPP
//
//  Created by Arthur Castro on 24/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import SwiftSoup

//Pin fake Tagua
fileprivate let pin1 = Pin(name: "fake01", latitude: -15.83616738, longitude: -48.05389939)
//Pin fake luziania
fileprivate let pin2 = Pin(name: "fake02", latitude: -16.25940154, longitude: -47.94953618)
//Pin fake Tagua
let pin3 = Pin(name: "fake03", latitude: -15.86562992, longitude: -48.02961393)

/**
 
 */
struct BrotherHoodModel: Codable {
    
   
    enum CodingKeys: String, CodingKey {
        case seq = "SEQ"
        case uf
        case group = "Grupo"
        case initialActivities = "inicio_atividades"
        case phones = "telefones"
        case publicPlace = "logradouro"
        case numberAddress = "numero"
        case complement = "complemento"
        case neighborhood = "bairro"
        case cep
        case city = "cidade"
        case referencePoint = "ponto_referencia"
        case mettings
        
    }
    
    
    
    let seq: Int
    let uf: String
    let group: String
    let initialActivities: String
    let phones: String
    let publicPlace: String
    let numberAddress: String
    let complement: String
    let neighborhood: String
    let cep: String
    let city: String
    let referencePoint: String
    let mettings: [String]
    
    
    
    
    //Decoder initializer needs container
    init(from decoder: Decoder) throws {
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.seq = try _container.decode(Int.self, forKey: .seq)
        self.uf = try _container.decode(String.self, forKey: .uf)
        self.group = try _container.decode(String.self, forKey: .group)
        self.initialActivities = try _container.decode(String.self, forKey: .initialActivities)
        self.phones = try _container.decode(String.self, forKey: .phones)
        self.publicPlace = try _container.decode(String.self, forKey: .publicPlace)
        self.numberAddress = try _container.decode(String.self, forKey: .numberAddress)
        self.complement = try _container.decode(String.self, forKey: .complement)
        self.neighborhood = try _container.decode(String.self, forKey: .neighborhood)
        self.cep = try _container.decode(String.self, forKey: .cep)
        self.city = try _container.decode(String.self, forKey: .city)
        self.referencePoint = try _container.decode(String.self, forKey: .referencePoint)
        self.mettings = try _container.decode([String].self, forKey: .mettings)
        
        
        
    }
    
    init(seq: Int, uf: String, group: String, initialActivities: String, phones: String, publicPlace: String, numberAddress: String, complement: String, neighborhood: String, cep: String, city: String, referencePoint: String, mettings: [String]) {
        self.seq = seq
        self.uf = uf
        self.group = group
        self.initialActivities = initialActivities
        self.phones = phones
        self.publicPlace = publicPlace
        self.numberAddress = numberAddress
        self.complement = complement
        self.neighborhood = neighborhood
        self.cep = cep
        self.city = city
        self.referencePoint = referencePoint
        self.mettings = mettings
    }
    
}




///Class responsible for managing the data of the registered pins
class PinDataSource {
    
    ///Method responsible for create pins
    func pins(completion: @escaping (Result<[Pin]>) -> Void){
        guard let url = URL(string: "https://admaa.aabrasil.org.br/ws/md/index.php?MD=1&AREA=18") else {
            fatalError("error fatal url ")
        }
        
        RequestHandler.request(from: url) { (result: Result<Data>) in
            switch result {
            case .success(let places):
                let htmlString = String(decoding: places, as: UTF8.self)
                do {
                    let doc: Document = try SwiftSoup.parse(htmlString)
                    guard let _textBody = try doc.body()?.text() else {
                        assertionFailure("TextBody not found")
                        return
                    }
                    
                    let link: Element = try doc.select("tr").first()!
                    let linkText: String = try link.text()
                    let text: String = _textBody
                    print(linkText)
//                    print(text)
                } catch Exception.Error(let type, let message){
                    print(message, type)
                } catch {
                    print("error")
                }
                
                print(htmlString)
            case .error(let error):
                print(error)
            }
        }
            
        
        let pins = [pin1,pin2,pin3]
        completion(Result.success(pins))
    }
      
        
        //fazer requisicao dos dados em html, converter pra json, popular pins
        //chamar o result de pins com nome latitude e longitude através de um completion método de requisicao 
    
        // Errorsóaceita
        //completion(Result.error(FileError.fileNotFound))
}
    
    

    




