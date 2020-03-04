//
//  ViewController.swift
//  client
//
//  Created by Quân on 3/2/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3002")!, config: [.log(true), .compress])
    var socket:SocketIOClient! = nil

    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var TempImageView: UIImageView!
    
    var lastPoint:CGPoint = CGPoint.zero
    var color:UIColor = UIColor.black
    var brushWidth:CGFloat = 10.0
    var opacity:CGFloat = 1.0
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        socket = manager.defaultSocket
        
        
        socket.connect()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        swiped = false
        // emit
        lastPoint = touch.location(in: view)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint){
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        TempImageView.image?.draw(in: view.bounds)
        
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        context.strokePath()
        
        TempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        TempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        swiped = true
        // emit
        let currentPoint = touch.location(in: view)
        socket.emit("move-picture", [lastPoint.x, lastPoint.y, currentPoint.x, currentPoint.y])
        // on
        socket.on("server-send") { (data, ack) in
            guard let data = data[0] as? [CGFloat] else {return}
            print(data)
            self.drawLine(from: CGPoint(x: data[0], y: data[1]), to: CGPoint(x: data[2], y: data[3]))
        }
        
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // emit
            socket.emit("move-picture", [lastPoint.x, lastPoint.y])
            // on
            socket.on("server-send") { (data, ack) in
                guard let data = data[0] as? [CGFloat] else {return}
                print(data)
                self.drawLine(from: CGPoint(x: data[0], y: data[1]), to: CGPoint(x: data[0], y: data[1]))
            }
            
        }
        
        UIGraphicsBeginImageContext(MainImageView.frame.size)
        MainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        TempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        MainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        TempImageView.image = nil
    }
}

