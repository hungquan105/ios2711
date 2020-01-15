//
//  ViewController.swift
//  client
//
//  Created by Quân on 1/15/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        GET(str: "http://localhost:3000/PHP")
        test(str: "http://localhost:3000/PHP")
    }
    
    func test(str:String){
        do {// url
        let url = URL(string: str)
        // data
            let data = try Data(contentsOf: url!)
            // json
        let json = try JSONDecoder.init().decode(Response.self, from: data)
            print(json.content)
            lbContent.text = json.content
        }catch {
            
        }
    }

    func GET(str:String){
        // url
        let url = URL(string: str)
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        // data
        let dataTask = URLSession.shared.dataTask(with: req) { (data, urlRes, error) in
            // json
            do {
                let json = try JSONDecoder.init().decode(Response.self, from: data!)
                print(json.content)
                DispatchQueue.main.async {
                    self.lbContent.text = json.content
                }
            } catch {
                print("JSON error")
            }
        }
        dataTask.resume()
        
    }
}

struct Response:Codable {
    let content:String
}
