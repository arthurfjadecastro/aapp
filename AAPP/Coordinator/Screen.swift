//
//  Screen.swift
//  AAPP
//
//  Created by Arthur Castro on 19/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation

///Enum responsible for enumerated the disposition of screens
struct Screen {
    
    let storyboard: String
    let controller: String
    
    static let map = Screen(storyboard: "Map", controller: "Map")
    static let entity = Screen(storyboard: "Entity", controller: "Entity")
    
}
