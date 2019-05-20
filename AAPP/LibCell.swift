//
//  LibCell.swift
//  AAPP
//
//  Created by Arthur Castro on 19/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
import Hero


class LibCell: UITableViewCell {
    
    @IBOutlet weak var libImage: UIImageView!
    
    @IBOutlet weak var libTitle: UILabel!
    
    @IBOutlet weak var popUpViewTradition: UIView!
    
    
    var img: UIImage? {
        didSet{
            self.libImage.image = self.img
        }
    }
    
    var title: String? {
        didSet{
            self.libTitle.text = self.title
        }
    }
    
    override func layoutSubviews() {
//        self.addShadowPopUpViewTradition()
    }
    
    
    
    ///Method responsible for adding shadow in pop up
    private func addShadowPopUpViewTradition(){
        self.popUpViewTradition.createShadowLayerWith(color: K.BottomCustomShadow.colorShadow, opacity: K.BottomCustomShadow.opacity, offset: K.BottomCustomShadow.offset, radius: K.BottomCustomShadow.radius)
        self.popUpViewTradition.createShadowLayerWith(color: K.TopCustomShadow.colorShadow, opacity: K.TopCustomShadow.opacity, offset: K.TopCustomShadow.offset, radius: K.TopCustomShadow.radius)
    }
    
    
}
