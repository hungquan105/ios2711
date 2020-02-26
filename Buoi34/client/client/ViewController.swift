//
//  ViewController.swift
//  client
//
//  Created by Quân on 2/26/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    @IBOutlet weak var imgv: UIImageView!
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3001")!, config: [.log(true), .compress])
    var socket:SocketIOClient! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        socket = manager.defaultSocket
//        // on
//        socket.on("server-send") { (data, ack) in
//            guard let point = data[0] as? [CGFloat] else {return}
//            print(point)
//            UIView.animate(withDuration: 2) {
//                self.imgv.frame.origin = CGPoint(x: point[0], y: point[1])
//            }
//        }
        socket.connect()
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let point = touch?.location(in: view)
//        // emit
//        socket.emit("move-picture", with: [[point!.x, point!.y]])
//        print(point!)
//    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: view)
        sender.view?.transform = (sender.view?.transform.translatedBy(x: point.x, y: point.y))!
        sender.setTranslation(CGPoint.zero, in: view)
    }
}

