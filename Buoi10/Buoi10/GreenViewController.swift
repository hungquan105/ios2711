//
//  GreenViewController.swift
//  Buoi10
//
//  Created by Quân on 12/18/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Green"
        
        lbName.text = name
        
    }
    
    @IBAction func PREVIOUS(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ROOT(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func VIEWCONTROLLER(_ sender: Any) {
        // xac dinh VC
        let YellowVC = navigationController!.viewControllers[1]
        // pop
        navigationController?.popToViewController(YellowVC, animated: true)
    }
}
