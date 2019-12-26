//
//  StudentCell.swift
//  Buoi13
//
//  Created by Quân on 12/25/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbGentle: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(student : Student){
        lbName.text = student.name
        lbAge.text = student.age
        lbGentle.text = student.gentle
        lbPhone.text = student.phonenumber
    }

}
