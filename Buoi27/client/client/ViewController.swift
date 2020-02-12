//
//  ViewController.swift
//  client
//
//  Created by Quân on 2/10/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
//    let Service = RequestService()
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LOAD(_ sender: Any) {
        
//        Service.requestWith(url: <#T##String#>, method: <#T##HTTPMethod#>, parameters: <#T##[String : String]?#>, headers: <#T##HTTPHeaders?#>, objectType: <#T##(Decodable & Encodable).Protocol#>, complete: <#T##CompletionHandleJSON##CompletionHandleJSON##(Bool, Any?, Error?) -> Void#>)
        
        RequestService.shared.requestWith(url: "http://localhost:3000/load", method: .get, parameters: ["":""], headers: nil, objectType: Response.self) { (result, json, error) in
            if result {
                guard let model = json as? Response else {return}
                print(model.message)
            } else {
                print(error?.localizedDescription)
            }
        }
        
//        let url:URL = URL(string: "http://localhost:3000/load")!
//        var req:URLRequest = URLRequest(url: url)
//        req.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
//            do {
//                let json = try JSONDecoder.init().decode(Response.self, from: data!)
//                print(json.message)
//            } catch {
//
//            }
//        }
//        task.resume()
        
        
//        AF.request("http://localhost:3000/load",
//                   method: .get,
//                   parameters: ["":""],
//                   encoder: URLEncodedFormParameterEncoder.default,
//                   headers: nil,
//                   interceptor: nil).response { (response) in
//                    switch response.result {
//                    case .success(let data):
//                        // lam gi do
//                        do {
//                            let json = try JSONDecoder.init().decode(Response.self, from: data!)
//                            print(json.message)
//                        } catch {
//                            print("JSON error")
//                        }
//                    case .failure(let error):
//                        // handle
//                        print(error.localizedDescription)
//                    }
//        }
    }
    
    @IBAction func LOGIN(_ sender: Any) {
        
//        let parameter
//        let header
        
//        viewModel.Login(parameter: Parameters)
        
//        let url:URL = URL(string: "http://localhost:3000/login")!
//        var req:URLRequest = URLRequest(url: url)
//        req.httpMethod = "POST"
//        // body
//        let str:String = "username=admin&&password=123"
//        let body:Data = str.data(using: .utf8)!
//        req.httpBody = body
//        let task = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
//            do {
//                let json = try JSONDecoder.init().decode(Response.self, from: data!)
//                print(json.message)
//            } catch {
//
//            }
//        }
//        task.resume()
        
//        let parameters = [
//            "username":"admin",
//            "password":"123",
//        ]
//
//        AF.request("http://localhost:3000/login", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: nil, interceptor: nil).response { (response) in
//            switch response.result {
//            case .success(let data):
//                // lam gi do
//                do {
//                    let json = try JSONDecoder.init().decode(Response.self, from: data!)
//                    // lam gi do voi json
//                    print(json.message)
//                } catch {
//                    print("JSON error")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
}


