//
//  ViewController.swift
//  Buoi11-02
//
//  Created by Quân on 12/16/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoToYellow(_ sender: Any) {
        // storyboard
//        let Main_Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // VC
        let testVC = storyboard?.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        let VC = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        let YellowVC = Main_Storyboard.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        // present
        self.present(testVC, animated: true, completion: nil)
    }
    
}

