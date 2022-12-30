//
//  ViewController.swift
//  OnboardingViewApp
//
//  Created by chungwoolee on 2022/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    var didShowOnBoardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if didShowOnBoardingView == false {
            didShowOnBoardingView = true
            let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            pageVC.modalPresentationStyle = .fullScreen
            
            self.present(pageVC, animated: true)
        }
        
 
    }
    
    
}

