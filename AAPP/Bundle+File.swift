//
//  Bundle+File.swift
//  AAPP
//
//  Created by Arthur Castro on 21/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation



extension Bundle {
    func url(_ file: File) -> URL? {
        
        return self.url(forResource: file.name, withExtension: file.extension)
        
    }
    
}
