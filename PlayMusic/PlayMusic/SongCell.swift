//
//  SongCell.swift
//  PlayMusic
//
//  Created by Quân on 12/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbSong: UILabel!
    @IBOutlet weak var lbSinger: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(song:Song){
        imgAvatar.image = song.avatar
        lbSong.text = song.name
        lbSinger.text = song.singer
    }
    
}
