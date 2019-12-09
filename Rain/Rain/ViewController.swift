//
//  ViewController.swift
//  Rain
//
//  Created by Quân on 12/9/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var CreateRainDrop:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CreateRainDrop = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            // Tao hat mua
            let randomX = CGFloat.random(in: 0...self.view.frame.width-50)
            let raindrop:UIImageView = UIImageView(frame: CGRect(x: randomX, y: -70, width: 50, height: 70))
            raindrop.image = #imageLiteral(resourceName: "raindrop")
            self.view.addSubview(raindrop)
            self.RaindropFalling(raindrop)
        }
        
//        PhepCong(so1: 3, so2: 5)
//        PhepCong(3, 5)
    }
    
    func PhepCong(_ so1:Int,_ so2:Int){
        let tong = so1 + so2
        print(tong)
    }

    func RaindropFalling(_ rainDrop : UIImageView){
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            rainDrop.frame.origin.y += 1
            if rainDrop.frame.origin.y > self.view.frame.height {
                rainDrop.frame.origin.y = -70
                rainDrop.frame.origin.x = CGFloat.random(in: 0...self.view.frame.width-50)
                self.CreateRainDrop.invalidate()
            }
        }
    }

}

