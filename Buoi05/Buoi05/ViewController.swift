//
//  ViewController.swift
//  Buoi05
//
//  Created by Quân on 12/6/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgv: UIImageView!
    var X:Int = 0
    var Y:Int = 0
    var arrPictures:[UIImage] = []
    var timer:Timer = Timer()
    let Width:CGFloat = 100
    let Height:CGFloat = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrPictures = [#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "2")]
        
//        var X:Int = 0
        
//        for i in 0..<Int(self.view.frame.width/Width) {
//            for j in 0..<Int(self.view.frame.height/Height) {
//                let img:UIImageView = UIImageView(frame: CGRect(x: i*100, y: j*100, width: 100, height: 100))
//                //            X += 1
//                            img.image = #imageLiteral(resourceName: "3")
//                            view.addSubview(img)
//            }
//        }
    }

    @IBAction func Rotate(_ sender: Any) {
        
//        UIView.animate(withDuration: 2) {
//            self.imgv.transform = CGAffineTransform(rotationAngle: .pi)
//        }
//        UIView.animate(withDuration: 2) {
//            self.imgv.transform = CGAffineTransform(rotationAngle: .pi*2)
//        }
        
//        UIView.animate(withDuration: 2) {
//            self.imgv.transform = CGAffineTransform(scaleX: 1, y: -1)
//        }
        
//        var index:Int = 0
//        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (rotate) in
//            self.imgv.transform = self.imgv.transform.rotated(by: .pi/180)
//            index += 1
//            if index == 360 {
//                timer.invalidate()
//            }
//        }
        
//        let rotate:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotate.fromValue = 0
//        rotate.toValue = 6.28*3
//        rotate.duration = 3
//        self.imgv.layer.add(rotate, forKey: "rotate")
        
        
//        var X:Int = 0
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (showPicture) in
//            if X == self.arrPictures.count {
//                showPicture.invalidate()
//            } else {
//                let img:UIImageView = UIImageView(frame: CGRect(x: X*100, y: 100, width: 200, height: 200))
//                img.image = self.arrPictures[X]
//                X += 1
//                self.view.addSubview(img)
//            }
//        }
        
//        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(appearImg), userInfo: nil, repeats: true)
        
        showImg()
        
    }
    
    func showImg(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(appearImg), userInfo: nil, repeats: true)
    }
        
    @objc func appearImg() {
        if X < Int(self.view.frame.width/Width) {
            let img:UIImageView = UIImageView(frame: CGRect(x: X * 100, y: 60 + Y * 100, width: 100, height: 100))
            X += 1
            img.image = arrPictures.randomElement()
            self.view.addSubview(img)
        } else {
            self.timer.invalidate()
            Y += 1
            X = 0
            self.showImg()
        }
    }
    
//    @objc func appearImg()
//    {
//        if (i*4+j<22){
//            let img:UIImageView = UIImageView(frame: CGRect(x: 7 + j * 100, y: 100 + i * 100, width: 100, height: 100))
//            img.image = #imageLiteral(resourceName: "4")
//            self.view.addSubview(img)
//        }else{
//            timer.invalidate()
//        }
//        if j<3{
//            j += 1
//        }else{
//            j = 0
//            i += 1
//        }
//    }
}
    


