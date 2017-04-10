//
//  PageViewController.swift
//  testing-scrollviewincell
//
//  Created by Mengying Feng on 10/4/17.
//  Copyright © 2017 iEmRollin. All rights reserved.
//

import UIKit

// resource: 
// http://samwize.com/2015/10/13/how-to-create-uipageviewcontroller-in-storyboard-in-container-view/
// https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html
// https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/PageViewControllers.html

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        
        let pageOne = storyboard?.instantiateViewController(withIdentifier: "PageOneViewController") as! PageOneViewController
        let pageTwo = storyboard?.instantiateViewController(withIdentifier: "PageTwoViewController") as! PageTwoViewController
        
        
        pages.append(pageOne)
        pages.append(pageTwo)
        
        setViewControllers([pageOne], direction: .forward, animated: false, completion: nil)
    }
    

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
