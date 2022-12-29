//
//  OnBoardingItemViewController.swift
//  OnboardingViewApp
//
//  Created by chungwoolee on 2022/12/29.
//

import UIKit

class OnBoardingItemViewController: UIViewController {

    var mainText = ""
    var subText = ""
    var topImage = UIImage()
    
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTitleLabel.text = mainText

    }


}
