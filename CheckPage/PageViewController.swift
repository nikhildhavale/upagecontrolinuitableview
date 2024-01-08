//
//  PageViewController.swift
//  CheckPage
//
//  Created by nikhil on 05/01/24.
//

import UIKit

class PageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var index = 0
    {
        didSet {
            imageView?.image = UIImage(named: "gallery_\(index + 1)")
        }
    }
    static func pageControler(index:Int) -> PageViewController
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       let pageController =  storyBoard.instantiateViewController(identifier: "PageViewController") as! PageViewController
        pageController.index = index
        return pageController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "gallery_\(index + 1)")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
