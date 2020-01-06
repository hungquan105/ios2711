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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
            Cell.bindData(product: product!)
            return Cell
        default:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "QuantityCell") as! QuantityCell
            return Cell
            
        }
    }
    
    
    
}
