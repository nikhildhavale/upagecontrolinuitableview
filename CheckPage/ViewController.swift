//
//  ViewController.swift
//  CheckPage
//
//  Created by nikhil on 05/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func swiftUIClicked(_ sender: Any) {
        let hostingController = SwiftUIHostingController.getHostingController()
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
    @IBAction func Combination(_ sender: Any) {
        
    }
    
    
    

}

