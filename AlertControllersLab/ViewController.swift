//
//  ViewController.swift
//  AlertControllersLab
//
//  Created by Cyril Garcia on 1/14/19.
//  Copyright © 2019 Cyril Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showAlert() {
        
        
        let myAlert = MyAlert()
    
        myAlert.addAction(buttonTitle: "Cancel", action: nil, with: nil)
        myAlert.addAction(buttonTitle: "Done", action: nil, with: nil)
   
    
        self.present(myAlert, animated: true, completion: nil)
    }
 

}

