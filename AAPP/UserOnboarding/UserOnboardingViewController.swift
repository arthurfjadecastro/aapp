//
//  UserOnboardingViewController.swift
//  AAPP
//
//  Created by Arthur Castro on 05/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import UIKit

class UserOnboardingViewController: UIViewController, Coordinable ,UIScrollViewDelegate {
    var coordinator: Coordinator?
    
    
    //MARK: - Properties
    var slides:[Slide] = [];
    var pageIndex = Int()
    

    @IBOutlet weak var buttonNext: UIButton!
    
    //MARK: - IBO
    @IBOutlet weak var scrollViewOnboarding: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollViewOnboarding.delegate = self
        self.slides = createSlides()
        self.setupSlideScrollView(slides: slides)
        self.pageControl.numberOfPages = slides.count
        self.pageControl.currentPage = 0
        self.view.bringSubviewToFront(self.pageControl)
        self.scrollViewOnboarding.showsVerticalScrollIndicator = false
        self.scrollViewOnboarding.showsHorizontalScrollIndicator = false
        self.scrollViewOnboarding.bounces = false
        
        self.scrollViewOnboarding.contentInsetAdjustmentBehavior = .automatic



        
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        self.scrollViewOnboarding.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        self.scrollViewOnboarding.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        self.scrollViewOnboarding.isPagingEnabled = true
        self.scrollViewOnboarding.contentSize.height = 1.0 
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            self.scrollViewOnboarding.addSubview(slides[i])
        }
    }
    
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageOnboarding.image = UIImage(named: "flat-color-icons:search")
        slide1.subTitleOnboarding.text = "Olá, seja bem vindo a nossa plataforma de busca, estamos felizes por ajudar."
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageOnboarding.image = UIImage(named: "flat-color-icons:multiple-devices-1")
        slide2.subTitleOnboarding.text = "De forma fácil e intuitiva você poderá navegar entre diversos estados e cidades."
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageOnboarding.image = UIImage(named: "flat-color-icons:todo-list")
        slide3.subTitleOnboarding.text = "Aqui você poderá encontrar os grupos e reuniões mais próximos de você"
        
        
      
        
        return [slide1, slide2, slide3]
    }
    
    func scrollend(_ scrollView: UIScrollView) {
     
        
    }
    
    
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.pageIndex = Int(round(scrollView.contentOffset.x/view.frame.width))
        pageControl.currentPage = self.pageIndex
        if(self.pageIndex == 2){
            self.buttonNext.setTitle("Iniciar", for: .normal )
        }else{
             self.buttonNext.setTitle("Próximo", for: .normal )
        }
        
//        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
//        print(currentHorizontalOffset)
//        print(maximumHorizontalOffset)
//        print(pageIndex)

//        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
//        pageControl.currentPage = Int(pageIndex)
        
//        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
//        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
//        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
//
//        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
//        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        

       
        
        /*
         * below code scales the imageview on paging the scrollview
         */
//        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
//        if(percentOffset.x > 0 && percentOffset.x <= 0.33) {
//            print(511)
//
////            slides[0].imageOnboarding.transform = CGAffineTransform(scaleX: (0.3-percentOffset.x)/0.33, y: (0.33-percentOffset.x)/0.33)
////            slides[0].imageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.33, y: percentOffset.x/0.33)
//
//        } else if(percentOffset.x > 0.33 && percentOffset.x <= 0.66) {
//            print(512)
////            slides[1].imageOnboarding.transform = CGAffineTransform(scaleX: (0.66-percentOffset.x)/0.33, y: (0.66-percentOffset.x)/0.33)
////            slides[1].imageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.66, y: percentOffset.x/0.66)
//
//        } else if(percentOffset.x > 0.66 && percentOffset.x <= 1) {
//            print(513)
////            slides[1].imageOnboarding.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.33, y: (1-percentOffset.x)/0.33)
////            slides[2].imageOnboarding.transform = CGAffineTransform(scaleX: percentOffset.x/1, y: percentOffset.x/1)
//        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        setupSlideScrollView(slides: slides)
    }
    
    
    //MARK: - IBA
    
    
    @IBAction func buttonNext(_ sender: Any) {
        
        
            if(self.pageIndex <= 1) {
                UIViewPropertyAnimator(duration: 1, dampingRatio: 1) {
                    self.scrollViewOnboarding.contentOffset.x = (self.scrollViewOnboarding.contentOffset.x + self.view.frame.width)
                }.startAnimation()
            }else {
                self.coordinator?.present(.map, beforePresenting: nil)
            }
        
        
        
       
        
    }
    

  
}
