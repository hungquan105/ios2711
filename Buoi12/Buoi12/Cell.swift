//
//  Cell.swift
//  Buoi12
//
//  Created by Quân on 12/23/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lbText1: UILabel!
    @IBOutlet weak var lbText2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(ms: MauSac){
        lbText1.backgroundColor = ms.color
        lbText2.text = ms.name
        lbText1.textColor = .white
    }
}
