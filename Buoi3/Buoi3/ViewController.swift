//
//  ViewController.swift
//  Buoi3
//
//  Created by Quân on 12/2/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgv: UIImageView!
    let imgvCode:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgvCode.frame = CGRect(x: 150, y: 600, width: 150, height: 150)
        imgvCode.image = #imageLiteral(resourceName: "4")
        view.addSubview(imgvCode)
    }

    @IBAction func MoveImage(_ sender: Any) {
        
        view.bringSubviewToFront(imgv)
        
//        do {
//            // URL
//            let url:URL = URL(string: "https://previews.123rf.com/images/nadya76/nadya761710/nadya76171000157/88138840-floral-light-blue-beautiful-background-wallpapers-of-flowers-blue-white-peony-flower-composition-clo.jpg")!
//            // Data
//           let data:Data = try Data(contentsOf: url)
//            // Image
//            imgv.image = UIImage(data: data)
//        } catch {
//            print("URL error")
//        }
        
        
        
//        imgv.image = #imageLiteral(resourceName: "4")
//        imgv.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
//        let Width = view.frame.width
    }
    
}

