//
//  ViewController.swift
//  Buoi14
//
//  Created by Quân on 12/30/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrProduct:[Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrProduct = [
            Product(name: "ban", SoLuong: 1),
            Product(name: "ghe", SoLuong: 1),
            Product(name: "ly", SoLuong: 1)
        ]
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.bindData(product: arrProduct[indexPath.row])
        
        // gan gia tri cho closure
        
        cell.didChangeQuantity = { (sl) in
            self.arrProduct[indexPath.row].SoLuong = sl
            self.tableView.reloadData()
        }
        
//        cell.Cong.tag = indexPath.row
//        cell.Cong.addTarget(self, action: #selector(funcCong), for: .touchUpInside)
        return cell
    }
    
    @objc func funcCong(sender:UIButton){
        print(sender.tag)
        arrProduct[sender.tag].SoLuong += 1
        self.tableView.reloadData()
    }
    
}

struct Product {
    let name:String
    var SoLuong:Int
}
