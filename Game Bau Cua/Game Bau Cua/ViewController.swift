//
//  ViewController.swift
//  Game Bau Cua
//
//  Created by Quân on 12/9/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var XucXac1: UIImageView!
    @IBOutlet weak var XucXac2: UIImageView!
    @IBOutlet weak var XucXac3: UIImageView!
    
    var arrImages:[UIImage] = [#imageLiteral(resourceName: "bau"),#imageLiteral(resourceName: "cua"),#imageLiteral(resourceName: "tom"),#imageLiteral(resourceName: "ca"),#imageLiteral(resourceName: "ga"),#imageLiteral(resourceName: "nai")]
 
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        UIView.animate(withDuration: 2, animations: {
            self.view.backgroundColor = .white
            self.Logo.alpha = 0
        }) { (step2) in
            self.Logo.removeFromSuperview()
            self.Background.isHidden = false
            self.XucXac1.isHidden = false
            self.XucXac2.isHidden = false
            self.XucXac3.isHidden = false
        }
    }


    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
            playSound()
            //
            var index:Int = 0
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { (timer) in
                index += 1
                self.XucXac1.transform = self.XucXac1.transform.rotated(by: .pi/180)
                self.XucXac2.transform = self.XucXac2.transform.rotated(by: .pi/180)
                self.XucXac3.transform = self.XucXac3.transform.rotated(by: .pi/180)
                if index == 360*3 {
                    timer.invalidate()
                    self.XucXac1.image = self.arrImages.randomElement()
                    self.XucXac2.image = self.arrImages.randomElement()
                    self.XucXac3.image = self.arrImages.randomElement()
                }
            }
        }
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "1", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }

    }
}

