//
//  PlayerViewController.swift
//  PlayMusic
//
//  Created by Quân on 12/27/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    
    var song:Song!
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgAvatar.image = song.avatar
        imgAvatar.layer.cornerRadius = 100
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            self.imgAvatar.transform = self.imgAvatar.transform.rotated(by: .pi/180)
        }
        let link: URL = Bundle.main.url(forResource: song.link, withExtension: "mp3")!
        //nhac
        playSound(audioURL: link)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        audioPlayer?.stop()
    }
    
    @IBAction func VolumnChange(_ sender: UISlider) {
        audioPlayer?.volume = sender.value
    }
    
    func playSound(audioURL: URL){
        //play downloaded file
                   do {
                       audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                       guard let player = audioPlayer else { return }

                       player.prepareToPlay()
                       player.play()
                   } catch let error {
                       print(error.localizedDescription)
                   }
    }
}
