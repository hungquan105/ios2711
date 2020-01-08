//
//  QuantityCell.swift
//  Buoi15
//
//  Created by Quân on 1/6/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class QuantityCell: UITableViewCell {

    @IBOutlet weak var lbQuantity: UILabel!
    var didChangeQuantity:((_ sl:Int) -> Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickAdd(_ sender: UIButton) {
        var sl:Int = Int(lbQuantity.text!)!
        sl += 1
        if didChangeQuantity != nil {
            didChangeQuantity(sl)
        }
    }
    @IBAction func clickNegative(_ sender: Any) {
        var sl:Int = Int(lbQuantity.text!)!
        sl -= 1
        if sl > 0{
            if didChangeQuantity != nil {
                       didChangeQuantity(sl)
                   }
        }
       
    }
    
}
