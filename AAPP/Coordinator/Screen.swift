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
    ///Strobyboard reference string
    let storyboard: String
    ///Controller reference string
    let controller: String
    
    ///Property responsible for containing the information needed to call the map screen
    static let map = Screen(storyboard: "Map", controller: "Map")
    ///Property responsible for containing the information needed to call the BrotherHood screen
    static let BrotherHood = Screen(storyboard: "BrotherHood", controller: "BrotherHood")
    
}
