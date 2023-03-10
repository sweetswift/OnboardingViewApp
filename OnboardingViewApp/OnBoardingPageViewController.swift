//
//  OnBoardingPageViewController.swift
//  OnboardingViewApp
//
//  Created by chungwoolee on 2022/12/29.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currentIndex = 0 {
        didSet{
            pageControl.currentPage = currentIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
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
        self.delegate = self
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for:.touchUpInside )
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin?.isActive = true
        hideButton()
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        //pageControl.isUserInteractionEnabled = false
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        }else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        
        self.currentIndex = sender.currentPage
        buttonPresentationStyle()
       
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
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        self.currentIndex = currentIndex
        
        if currentIndex == pages.count - 1 {
            return pages.first
        }else {
            return pages[currentIndex + 1]
        }
        
    }
    
    
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
       
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        
        self.currentIndex = currentIndex
        
        buttonPresentationStyle()
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1 {
            //버튼보여주기
            self.showButton()
        } else {
            //버튼가리기
            self.hideButton()
        }
    }
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
    
}
