//
//  YellowViewController.swift
//  Buoi10
//
//  Created by Quân on 12/18/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

// storyboard
let Main_Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

class YellowViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("YELLOW DID LOAD")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("YELLOW WILL APPEAR")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("YELLOW DID APPEAR")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("YELLOW WILL DISAPPEAR")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("YELLOW DID DISAPPEAR")
    }
    
    @IBAction func GoToGreen(_ sender: Any) {
        
        // VC
        let GreenVC = Main_Storyboard.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
//        GreenVC.lbName.text = tfName.text!
        GreenVC.name = tfName.text!
        // go to green
        navigationController?.pushViewController(GreenVC, animated: true)
    }

}
