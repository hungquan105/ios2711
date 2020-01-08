//
//  ProductDetailViewController.swift
//  Buoi15
//
//  Created by Quân on 1/6/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var id:String?
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        product = arrProduct.filter{ $0.id == id }.first
        
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func addToCart(_ sender: Any) {
        // kiem tra trung san pham -> sua so luong
        // kiem tra nhieu san pham -> duyet mang for or fillter
//        if () {
//
//        }
        
       Cart.append(product!)

        let Cartvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
         
        self.navigationController!.pushViewController(Cartvc!, animated: true)
    }
    
}

extension ProductDetailViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            
            return Cell
        default:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "QuantityCell") as! QuantityCell
            Cell.lbQuantity.text = "\(product?.quantity ?? 2)"
            Cell.didChangeQuantity = { (sl) in
                self.product?.quantity = sl
                self.tableView.reloadData()
            }
            return Cell
            
        }
    }
    
    
    
}
