//
//  TransparentNaviViewController.swift
//  Buoi11-tabbar
//
//  Created by Quân on 12/20/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class TransparentNaviViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    
}
