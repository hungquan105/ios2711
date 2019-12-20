//
//  ViewController.swift
//  Buoi11
//
//  Created by Quân on 12/20/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YellowViewControllerDelegate {
    
    func doSomethingWith(data: String) {
        print(data)
    }
    
    let chuoi:String = "Hello World!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MainVCtoYellowVC") {
            let YellowVC = segue.destination as! YellowViewController
            YellowVC.chuoi = chuoi
            YellowVC.delegate = self
        }
    }

    @IBAction func GoToYellow(_ sender: Any) {
        
//        // sceneDelegate
//        let scene = self.view.window?.windowScene?.delegate as! SceneDelegate
//        // func goToYellow
//        scene.GoToYellow(data: chuoi)
        
        self.performSegue(withIdentifier: "MainVCtoYellowVC", sender: self)
        
    }
    
}

