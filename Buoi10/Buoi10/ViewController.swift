//
//  ViewController.swift
//  Buoi10
//
//  Created by Quân on 12/18/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print("RED DID LOAD")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("RED WILL APPEAR")
        let alert = UIAlertController(title: "Welcome", message: "Quan Nguyen", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("RED DID APPEAR")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("RED WILL DISAPPEAR")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("RED DID DISAPPEAR")
    }
}

