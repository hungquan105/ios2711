//
//  ViewController.swift
//  client
//
//  Created by Quân on 2/19/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    @IBOutlet weak var lbWelcome: UILabel!
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    var socket:SocketIOClient! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        socket = manager.defaultSocket
        socket.connect()
        socket.on("welcome") { (data, ack) in
            self.lbWelcome.text = data[0] as? String ?? ""
        }
    }


}

