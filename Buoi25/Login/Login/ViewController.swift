//
//  ViewController.swift
//  Login
//
//  Created by Quân on 2/7/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url:URL = URL(string: "http://localhost:3000/check")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        // lay du lieu tu bo nho
        let token:String = UserDefaults.standard.string(forKey: "token") ?? ""
        let str:String = "token=\(token)"
//        print(str)
        let body:Data = str.data(using: .utf8)!
        req.httpBody = body
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            do {
                let json = try JSONDecoder.init().decode(BaseResponse.self, from: data!)
                print(json.result)
                // lay du lieu ra xai
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Thong Bao", message: json.message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } catch {
                print("JSON error")
            }
        }
        task.resume()
    }

    @IBAction func LOGIN(_ sender: Any) {
        let url:URL = URL(string: "http://localhost:3000/login")!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            do {
                let json = try JSONDecoder.init().decode(Token.self, from: data!)
                print(json.token)
                // luu vao bo nho - string thi set any
                UserDefaults.standard.set(json.token, forKey: "token")
            } catch {
                print("JSON error")
            }
        }
        task.resume()
    }
    
}

struct Token:Codable {
    var token:String
}

public struct BaseResponse:Codable {

        public var data : Result
        public var message : String
        public var result : Bool
        
}

public struct Result:Codable {

        public var name : String
        public var username : String
        
}
