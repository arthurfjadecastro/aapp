//
//  Load.swift
//  Fraldario
//
//  Created by Matheus Gomes Queiroz on 22/12/2017.
//  Copyright © 2017 Gustavo Arthur Vollbrecht. All rights reserved.
//

import UIKit


protocol FatController: AnyObject {
    
}

extension UIViewController: FatController {
    
}

extension FatController where Self: UIViewController {
    
    
    /**
     Initializes a loading animation on view. You can stop this animation calling the stopLoading() method.
    */
    func startLoading() {
        guard let _loadingView = LoadingView.initFromNib() else { return }
        _loadingView.frame = view.bounds
        view.addSubview(_loadingView)
        _loadingView.startAnimation()
    }
    
    
    /**
     Stops the loading animation on view. You should be use this function after call the startLoading() function, but nothing happens wheter you didn't call these method.
    */
    func stopLoading() {
        for view in view.subviews {
            if view is LoadingView {
                (view as! LoadingView).stopAnimation()
                view.removeFromSuperview()
                return
            }
        }
    }
}
