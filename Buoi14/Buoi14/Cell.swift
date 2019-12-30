//
//  Cell.swift
//  Buoi14
//
//  Created by Quân on 12/30/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var Cong: UIButton!
    
    @IBOutlet weak var lbSoLuong: UILabel!
    
    @IBOutlet weak var Tru: UIButton!
    
    // call back function - closure
    var didChangeQuantity:((_ sl:Int)->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func bindData(product:Product){
        lbSoLuong.text = "\(product.SoLuong)"
        lbName.text = product.name
    }
    
    
    @IBAction func Tru(_ sender: Any) {
        var sl = Int(lbSoLuong.text!)!
        sl -= 1
        
        // goi closure
        
        if self.didChangeQuantity != nil {
            self.didChangeQuantity(sl)
        }
    }
    @IBAction func Cong(_ sender: Any) {
        var sl = Int(lbSoLuong.text!)!
        sl += 1
        
        // goi closure
        
        if self.didChangeQuantity != nil {
            self.didChangeQuantity(sl)
        }
        
    }
    
}
