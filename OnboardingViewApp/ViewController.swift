//
//  ViewController.swift
//  OnboardingViewApp
//
//  Created by chungwoolee on 2022/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pageVC = OnBoardingPageViewController()
        self.present(pageVC, animated: true)
    }
    
    
}

