//
//  PageTableViewCell.swift
//  CheckPage
//
//  Created by nikhil on 05/01/24.
//

import UIKit

class PageTableViewCell: UITableViewCell {
    var pageController:UIPageViewController!
   // var currentIndex = 0
    let array = ["gallery_1","gallery_2","gallery_3","gallery_4","gallery_5"]
    var controllers = [Int:UIViewController]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update()
    {
        if pageController == nil {
            pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            pageController.dataSource = self
           // UIPageControl.appearance().pageIndicatorTintColor =  .secondaryLabel
           // UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().backgroundStyle = .prominent
            let viewController = PageViewController.pageControler(index: 0)
            controllers[0] = viewController
            pageController?.setViewControllers([viewController], direction: .forward, animated: true)
            self.contentView.addSubview(pageController.view)
            pageController.view.translatesAutoresizingMaskIntoConstraints = false
           let topConstraint =  self.contentView.topAnchor.constraint(equalTo: pageController.view.topAnchor)
            topConstraint.constant = 20
            topConstraint.isActive = true 
            let bottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: pageController.view.bottomAnchor)
            bottomConstraint.constant = 20
            bottomConstraint.isActive = true
            self.contentView.leadingAnchor.constraint(equalTo: pageController.view.leadingAnchor).isActive = true
            self.contentView.trailingAnchor.constraint(equalTo: pageController.view.trailingAnchor).isActive = true
        }
       

    }
    
}
extension PageTableViewCell:UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var currentIndex = 0
        if let controller = pageController.viewControllers?.first as? PageViewController
        {
            currentIndex = controller.index
        }
        if currentIndex == 0
        {
            return nil
        }
        if let vc = controllers[currentIndex - 1]
        {
            return vc
        }
        let viewController = PageViewController.pageControler(index: currentIndex - 1)
        controllers[currentIndex - 1] = viewController
        return viewController

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var currentIndex = 0
        if let controller = pageController.viewControllers?.first as? PageViewController
        {
            currentIndex = controller.index
        }
        if currentIndex == 4
        {
            return nil
        }
        if let vc = controllers[currentIndex + 1]
        {
            return vc
        }
        let viewController = PageViewController.pageControler(index: currentIndex + 1)
        controllers[currentIndex + 1] = viewController
        return viewController
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return 5
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        var currentIndex = 0
        if let controller = pageController.viewControllers?.first as? PageViewController
        {
            currentIndex = controller.index
        }
        return currentIndex
    }
    
}
