//
//  CartViewController.swift
//  Buoi15
//
//  Created by Quân on 1/8/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var section:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
   

}
extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Cart.count == 0 {
            return 1
        } else {
            return Cart.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInCartCell", for: indexPath) as! ProductInCartCell
        if Cart.count == 0 {
            cell.NonProductView.isHidden = false
            cell.ProductListView.isHidden = true
        } else {
            cell.NonProductView.isHidden = true
            cell.ProductListView.isHidden = false
        }
        return cell
    }
    
}
