//
//  RoundedView.swift
//  Fraldario
//
//  Created by Matheus Gomes Queiroz on 22/12/2017.
//  Copyright © 2017 Gustavo Arthur Vollbrecht. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
