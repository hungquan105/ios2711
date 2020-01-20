//
//  ViewController.swift
//  client
//
//  Created by Quân on 1/17/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LOGIN(_ sender: Any) {
        // url
        let url:URL = URL(string: "http://localhost:3000/login")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        // body
        let str:String = String(format: "username=%@&password=%@", tfUsername.text!, tfPassword.text!)
        let chuoi:String = "username=\(tfUsername.text!)&password=\(tfPassword.text!)"
        print(str)
        print(chuoi)
        let body:Data = str.data(using: .utf8)!
        req.httpBody = body
        // data
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            do {
                let json = try JSONDecoder.init().decode(Response.self, from: data!)
                var msg:String = ""
                if json.result {
                    msg = json.message
                } else {
                    msg = json.message
                }
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Thong Bao", message: msg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } catch {
                print("JSON error")
            }
        }
        task.resume()
        // json
    }
    
}

struct Response:Codable {
    let result:Bool
    let message:String
}
