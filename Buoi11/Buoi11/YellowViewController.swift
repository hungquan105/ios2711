//
//  YellowViewController.swift
//  Buoi11
//
//  Created by Quân on 12/20/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

protocol YellowViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: String)
}

class YellowViewController: UIViewController {

    weak var delegate : YellowViewControllerDelegate?
    @IBOutlet weak var lbYellow: UILabel!
    var chuoi:String = ""
    let Name:String = "Quan Nguyen"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbYellow.text = chuoi
    }
    
    @IBAction func Back(_ sender: Any) {
        self.delegate?.doSomethingWith(data: Name)
    }
    

}
