//
//  ScreenTransition.swift
//  AAPP
//
//  Created by Arthur Castro on 28/12/2018.
//  Copyright © 2018 Arthur Castro. All rights reserved.
//

import Foundation
import UIKit
//fadein
//fadeout
//Move
//cobre a tela parcialmente ou totalmente, se a transicao está saindo ou entrando.


private enum Transition {
    case fadeIn
    case fadeOut
    case bottomToTop
    case topToBottom
}


private enum Cover {
    case full
    case partial
}

fileprivate let transitionFailure = { assertionFailure("Fail when try find transition") }


struct ScreenTransition {
    
   
    
    
    private let cover: Cover?
    private let transition: Transition?

    static let popUpIn = ScreenTransition().partialCover().bottomToTop()
   // static let popUpOut = ScreenTransition().topToBottom()
    
    init() {
        self.init(cover: nil, transition: nil)
    }
    
    
    
    private init(cover:Cover?, transition:Transition?) {
        self.cover = cover
        self.transition = transition
    }
    
    
    
    //MARK: - Helpers Method
    

    
    //MARK: - API
    func present(current: UIViewController, next: UIViewController){
        if let _cover = cover  {
            switch _cover {
            case .full:
                next.modalPresentationStyle = .overFullScreen
            case .partial:
                next.modalPresentationStyle = .overCurrentContext
            }
        }else{
            assertionFailure("Fail when try find cover")
        }
        
        if let _transition = transition  {
            switch _transition {
            case .bottomToTop:
                next.modalTransitionStyle = .coverVertical
            case .fadeIn:
                next.modalTransitionStyle = .crossDissolve
            default: transitionFailure()
            }
        }else{
            transitionFailure()
        }
        current.present(next, animated: true, completion: nil)
    }
    
    func dismiss(current: UIViewController){
        assertionFailure("This method isn't implemented")
        return
        if let _transition = transition  {
            switch _transition {
            case .topToBottom:
                current.modalTransitionStyle = .coverVertical
            case .fadeOut:
                current.modalTransitionStyle = .crossDissolve
            default: transitionFailure()
            }
        }else{
            transitionFailure()
        }
        current.dismiss(animated: true, completion: nil)
    }
    
    private func fadeOut() -> ScreenTransition {
        return ScreenTransition(cover: cover, transition: .fadeOut)
    }
    
    private func fadeIn() -> ScreenTransition {
        return ScreenTransition(cover: cover, transition: .fadeIn)
    }
    
    private func fullCover() -> ScreenTransition {
        return ScreenTransition(cover: .full, transition: transition)
    }
    
    private func partialCover() -> ScreenTransition {
        return ScreenTransition(cover: .partial, transition: transition)
    }
    private func bottomToTop() -> ScreenTransition {
        return ScreenTransition(cover: cover , transition: .bottomToTop)
    }
    private func topToBottom() -> ScreenTransition {
        return ScreenTransition(cover: cover, transition: .topToBottom)
    }
}






