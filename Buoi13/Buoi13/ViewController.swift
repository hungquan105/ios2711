//
//  ViewController.swift
//  Buoi13
//
//  Created by Quân on 12/25/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrClass:[Class] = []
//    var arrStudent:[Student] = []
    let newClass:Class = Class(name: "PHP", students: [
        Student(name: "John", age: "22", gentle: "Nam", phonenumber: "123123123")
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrClass = [
            Class(name: "IOS", students: [
                Student(name: "Teo Nguyen", age: "19", gentle: "Nam", phonenumber: "111222333"),
                Student(name: "Ti Nguyen", age: "19", gentle: "Nu", phonenumber: "112233445"),
                Student(name: "Tun Nguyen", age: "20", gentle: "Nam", phonenumber: "123456789"),
                Student(name: "To Nguyen", age: "19", gentle: "Nam", phonenumber: "987654321"),
                Student(name: "Bi Nguyen", age: "21", gentle: "Nam", phonenumber: "321321321")
            ]),
            Class(name: "ANDROID", students: [
                Student(name: "Bo Nguyen", age: "19", gentle: "Nu", phonenumber: "654654654"),
                Student(name: "Beo Nguyen", age: "22", gentle: "Nam", phonenumber: "987987987"),
                Student(name: "Tum Nguyen", age: "19", gentle: "Nam", phonenumber: "345345354"),
                Student(name: "Teo Nguyen", age: "19", gentle: "Nam", phonenumber: "111222333"),
                Student(name: "Ti Nguyen", age: "19", gentle: "Nu", phonenumber: "112233445"),
                Student(name: "Tun Nguyen", age: "20", gentle: "Nam", phonenumber: "123456789"),
                Student(name: "To Nguyen", age: "19", gentle: "Nam", phonenumber: "987654321"),
                Student(name: "Bi Nguyen", age: "21", gentle: "Nam", phonenumber: "321321321")

            ])
        ]
    }
    
    @IBAction func ADD(_ sender: Any) {
        arrClass.append(newClass)
        tableView.reloadData()
        print(arrClass[2].name)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrClass.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrClass[section].students.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrClass[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.bindData(student: arrClass[indexPath.section].students[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "DELETE") { (action, indexPath) in
            self.arrClass[indexPath.section].students.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        return [delete]
    }
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: <#T##UIContextualAction.Style#>, title: <#T##String?#>, handler: <#T##UIContextualAction.Handler##UIContextualAction.Handler##(UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void#>)
//        let leadingActions = UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
//        return leadingActions
//    }
}

struct Class {
    let name:String
    var students:[Student]
}

struct Student {
    let name:String
    let age:String
    let gentle:String
    let phonenumber:String
}
