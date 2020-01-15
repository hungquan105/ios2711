//
//  ViewController.swift
//  Buoi15
//
//  Created by Quân on 1/3/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            // url
            let url:URL = Bundle.main.url(forResource: "Data", withExtension: "json")!
            // data
            let data:Data = try Data(contentsOf: url)
            let str:String = String(data: data, encoding: .utf8)!
            print(str)
            // do vao mang
            do {
                let json = try JSONDecoder.init().decode(Root.self, from: data)
//                print(json)
                arrProduct = json.product
                print(arrProduct[1].name)
            } catch {
                print("json error")
            }
        } catch {
            print("data error")
        }
        
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as! bannerCell
            
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            // gan gia tri closrure
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
            
            cell.didChangeScreen = { (id) in
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
                vc!.id = id
                self.navigationController!.pushViewController(vc!, animated: true)
                
            }
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 1 :
            return 100
        default:
            return 600
        }
    }
    
}
