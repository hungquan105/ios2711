//
//  ViewController.swift
//  Buoi12
//
//  Created by Quân on 12/23/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrMauSac:[MauSac] = []
//    var arrColor:[UIColor] = []
//    var arrName:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        arrMauSac = [
            MauSac(name: "Red", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
            MauSac(name: "Yellow", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
            MauSac(name: "Green", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),
            MauSac(name: "Blue", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
            MauSac(name: "Purple", color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
            MauSac(name: "Pink", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
        ]
        
//        arrColor = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]
//        arrName = ["Red","Yellow","Green","Blue","Purple"]
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMauSac.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
//        cell.textLabel?.text = "Hello World!"
        
//        cell.backgroundColor = arrMauSac[indexPath.row].color
//        cell.textLabel?.text = arrMauSac[indexPath.row].name
        
//        cell.lbText1.backgroundColor = arrMauSac[indexPath.row].color
//        cell.lbText2.text = arrMauSac[indexPath.row].name
        
        cell.bindData(ms: arrMauSac[indexPath.row])
        
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct MauSac {
    let name:String
    let color:UIColor
}

