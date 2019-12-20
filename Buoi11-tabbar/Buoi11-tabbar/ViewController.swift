//
//  ViewController.swift
//  Buoi11-tabbar
//
//  Created by Quân on 12/20/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoToTabbar(_ sender: Any) {
        let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
        scene.GoToTabbar()
    }
    
}

