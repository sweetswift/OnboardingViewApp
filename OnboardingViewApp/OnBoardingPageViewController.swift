//
//  OnBoardingPageViewController.swift
//  OnboardingViewApp
//
//  Created by chungwoolee on 2022/12/29.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
    }
    
    func makePageVC() {
        let itemVC1 = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.mainText = "첫번째"
        itemVC1.subText = "앱에대한 설명 첫번째 입니다."
        itemVC1.topImage = UIImage(named: "sun.min")
        
        let itemVC2 = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "두번째"
        itemVC2.subText = "앱에대한 설명 두번째 입니다."
        itemVC2.topImage = UIImage(named: "2.circle.fill")
        
        let itemVC3 = OnBoardingItemViewController(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "세번째"
        itemVC3.subText = "앱에대한 설명 세번째 입니다."
        itemVC3.topImage = UIImage(named: "3.circle.fill")
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        setViewControllers([itemVC1], direction: .forward, animated: true)
        
        self.dataSource = self
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for:.touchUpInside )
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
   @objc func dismissPageVC() {
        self.dismiss(animated: true)
    }
    
}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let curretIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if curretIndex == 0 {
            return pages.last
        }else {
            return pages[curretIndex - 1]
        }
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let curretIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if curretIndex == pages.count - 1 {
            return pages.first
        }else {
            return pages[curretIndex + 1]
        }
        
    }
    
    
}
