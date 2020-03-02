//
//  ViewController.swift
//  client
//
//  Created by Quân on 3/2/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        swiped = false
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
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        UIGraphicsBeginImageContext(MainImageView.frame.size)
        MainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        TempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        MainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        TempImageView.image = nil
    }
}

