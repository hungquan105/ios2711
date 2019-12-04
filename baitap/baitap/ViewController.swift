//
//  ViewController.swift
//  baitap
//
//  Created by Quân on 12/4/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let press:UIButton = UIButton()
    
    
    
    @IBOutlet weak var imgvAvatar: UIImageView!
    
//    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var lbSlider: UILabel!
    
    var timer:Timer = Timer()
    
    @IBAction func Click(_ sender: Any) {
        print("Click")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mySlider.minimumValue = 0
        mySlider.maximumValue = 2
        mySlider.value = 0
        
        setupButton()
        
    }
    
    func setupButton(){
        press.frame = CGRect(x: 300, y: 200, width: 100, height: 100)
        press.setTitle("PRESS", for: .normal)
        press.setTitleColor(.black, for: .normal)
        view.addSubview(press)
        
        press.addTarget(self, action: #selector(movePicture), for: .touchUpInside)
        
    }
    
    @IBAction func MoveImage(_ sender: Any) {
//        UIView.animate(withDuration: 3) {
//            self.imgvAvatar.frame.origin.y = 600
//        }
        
//        UIView.animate(withDuration: 3,
//                       animations: {
//                        self.imgvAvatar.frame.origin.y = 600
//        }) { (_) in
//            UIView.animate(withDuration: 3) {
//                self.imgvAvatar.frame.origin.y = 70
//            }
//        }
        
//        UIView.animate(withDuration: 5,
//                       delay: 2,
//                       options: .curveEaseInOut,
//                       animations: {
//                        self.imgvAvatar.frame.origin.y = 600
//        },
//                       completion: nil)
//    }
    
//        UIView.animate(withDuration: 3,
//                       delay: 0,
//                       usingSpringWithDamping: 1,
//                       initialSpringVelocity: 5,
//                       options: .repeat,
//                       animations: {
//                        self.imgvAvatar.frame.origin.y = 600
//        },
//                       completion: nil)
//
//
//    }
    
//        Timer.scheduledTimer(withTimeInterval: 0.01,
//                             repeats: true) { (timer) in
//                                self.imgvAvatar.frame.origin.y += 1
//                                if self.imgvAvatar.frame.origin.y > 600 {
//                                    timer.invalidate()
//                                }
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(movePicture),
                             userInfo: nil,
                             repeats: true)
        
        
    
    }
    
    @objc func movePicture () {
        self.imgvAvatar.frame.origin.y += 1
        if self.imgvAvatar.frame.origin.y > 600 {
            timer.invalidate()
        }
    }
    
    @IBAction func funcSwitch(_ sender: UISwitch) {
        if sender.isOn == true{
            imgvAvatar.image = #imageLiteral(resourceName: "3")

        }else{
            imgvAvatar.image = #imageLiteral(resourceName: "2")
        }
    }
    @IBAction func funcSlider(_ sender: UISlider) {
        lbSlider.text = "\(sender.value)"
//        imgvAvatar.layer.cornerRadius = CGFloat(sender.value)
        imgvAvatar.transform = CGAffineTransform(scaleX: CGFloat(sender.value), y: CGFloat(sender.value))
//        imgvAvatar.transform = imgvAvatar.transform.scaledBy(x: CGFloat(sender.value), y: CGFloat(sender.value))
    }
    
    

}

