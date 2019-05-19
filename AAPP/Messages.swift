//
//  Movie.swift
//
//
//  Created by Arthur Castro on 22/03/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit

/**

 */
struct Messages {
    
    //MARK: - Properties
    
   
    ///Property related to the movie name
    let title: String
    ///Property related to the image movie
    let image: URL
    ///Property equivalent to the movie description
    let synopsys: String
    
    //MARK: - Initializer
    
    init(title: String, image: URL, genres: [String], synopsys: String) {
        self.title = title
        self.image = image
      
        self.synopsys = synopsys
    }
    
    //MARK: - Helper Methods
    

}
