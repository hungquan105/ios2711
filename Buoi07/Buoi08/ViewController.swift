//
//  ViewController.swift
//  Buoi08
//
//  Created by Quân on 12/11/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AvatarWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            AvatarWidth.constant = 100
            
        } else {
            print("Portrait")
            AvatarWidth.constant = 200
        }
    }
}

