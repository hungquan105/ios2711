//
//  ViewController.swift
//  Buoi02
//
//  Created by Quân on 11/29/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbHienThi: [UILabel]!
    
    // Outlet
    @IBOutlet weak var tfSo1: UITextField!
    @IBOutlet weak var tfSo2: UITextField!
    @IBOutlet weak var lbTong: UILabel!
    // Bien: Khai bao , Kieu bien
    var So1:Double?
    var So2:Double?
        // Mang: [a, b, c]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in lbHienThi {
            i.backgroundColor = .red
        }
    }

    @IBAction func Begin(_ sender: Any) {
        print("Begin")
    }
    @IBAction func Changed(_ sender: Any) {
        print("Changed")
    }
    @IBAction func End(_ sender: Any) {
        print("End")
    }
    
    // Action
    @IBAction func Cong(_ sender: Any) {
        PhepTinh(ToanTu: "+")
    }
    
    @IBAction func Tru(_ sender: Any) {
        PhepTinh(ToanTu: "-")
    }
    
    @IBAction func Nhan(_ sender: Any) {
        PhepTinh(ToanTu: "*")
    }
    
    @IBAction func Chia(_ sender: Any) {
        PhepTinh(ToanTu: "/")
    }
    
    func PhepTinh(ToanTu: String){
        print(ToanTu)
        So1 = Double(tfSo1.text!)
        So2 = Double(tfSo2.text!)

        if (So1 != nil && So2 != nil)  {
            
            let expression:NSExpression = NSExpression(format: "\(So1!)\(ToanTu)\(So2!)")
            guard let result = expression.expressionValue(with: nil, context: nil) as? Double else {return}
            lbTong.text = "\(result)"
            
//            switch ToanTu {
//            case "+":
//                let KetQua:Int = (So1 ?? 0) + (So2 ?? 0)
//                lbTong.text = "\(KetQua)"
//            case "-":
//                let KetQua:Int = (So1 ?? 0) - (So2 ?? 0)
//                lbTong.text = "\(KetQua)"
//            case "*":
//                let KetQua:Int = (So1 ?? 0) * (So2 ?? 0)
//                lbTong.text = "\(KetQua)"
//            default:
//                let KetQua:Float = Float(So1!) / Float(So2!)
//                lbTong.text = "\(KetQua)"
//            }
            
        } else {
            // Thong Bao
            let alert:UIAlertController = UIAlertController(title: "Thong Bao", message: "Ban nhap sai cu phap, Vui long nhap lai.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //    @IBAction func Click(_ sender: UIButton) {
//        So1 = Int(tfSo1.text!)
//        So2 = Int(tfSo2.text!)
//
//        if (So1 != nil && So2 != nil)  {
//            let Tong:Int = (So1 ?? 0) + (So2 ?? 0)
//            lbTong.text = "\(Tong)"
//        } else {
//            // Thong Bao
//            let alert:UIAlertController = UIAlertController(title: "Thong Bao", message: "Ban nhap sai cu phap, Vui long nhap lai.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//
//
//    }
    
        // Ham: if else, for, while, switch, ...
    
        // Dac Biet: ?(wrap) & !(unwrap)

}

