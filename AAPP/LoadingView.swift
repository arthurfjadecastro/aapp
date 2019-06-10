//
//  LoadingView.swift
//  Memo
//
//  Created by Matheus Gomes Queiroz on 21/08/17.
//  Copyright © 2017 Italo Henrique Queiroz. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    //MARK: - Properties
    @IBOutlet weak var firstView: RoundedView!
    @IBOutlet weak var secondView: RoundedView!
    @IBOutlet weak var thirdView: RoundedView!
    var animating = false
    
    
    //MARK: - Initializers
    static func initFromNib() -> LoadingView? {
        guard let loadingView = Bundle.main.loadNibNamed("LoadingView", owner: nil, options: nil)?.first as? LoadingView else { return nil }
        loadingView.setup()
        return loadingView
    }
    
    
    //MARK: - Animation methods
    func startAnimation() {
        isHidden = false
        animating = true
        
        let duration = 0.3
        let firstTime = 0.0
        let secondTime = 0.15
        let thirdTime = 0.3
        let fourthTime = 0.45
        let fifthTime = 0.6
        let endTime = 0.9
        
        UIView.animateKeyframes(
            withDuration: endTime,
            delay: 0.0,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: firstTime, relativeDuration: duration, animations: {
                    self.firstView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                })
                UIView.addKeyframe(withRelativeStartTime: secondTime, relativeDuration: duration, animations: {
                    self.secondView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                })
                UIView.addKeyframe(withRelativeStartTime: thirdTime, relativeDuration: duration, animations: {
                    self.thirdView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                })
                
                UIView.addKeyframe(withRelativeStartTime: thirdTime, relativeDuration: duration, animations: {
                    self.firstView.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: fourthTime, relativeDuration: duration, animations: {
                    self.secondView.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: fifthTime, relativeDuration: duration, animations: {
                    self.thirdView.transform = .identity
                })
            },
            completion: { _ in
                if self.animating {
                    self.startAnimation()
                }
            }
        )
    }
    
    func stopAnimation() {
        animating = false
        isHidden = true
    }
    
    private func setup() {
        isHidden = true
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
}
