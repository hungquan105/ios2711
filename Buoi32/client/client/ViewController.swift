//
//  ViewController.swift
//  client
//
//  Created by Quân on 2/24/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    var socket:SocketIOClient! = nil

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var arrContent:[Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket = manager.defaultSocket
        socket.connect()
        socket.on("nguoinhan") { (data, ack) in
            guard let content = data[0] as? String else {return}
            self.arrContent.append(Content(content: content, kind: 1))
            self.tableViewHeight.constant += 50
            self.tableView.reloadData()
        }
    }

    @IBAction func SEND(_ sender: Any) {
        socket.emit("chat", tfContent.text!)
        self.arrContent.append(Content(content: tfContent.text!, kind: 0))
        self.tableViewHeight.constant += 50
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.lbContent.text = arrContent[indexPath.row].content
        cell.lbContent.translatesAutoresizingMaskIntoConstraints = false
        cell.lbContent.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        if arrContent[indexPath.row].kind == 1 {
            cell.lbContent.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20).isActive = true
        } else {
            cell.lbContent.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20).isActive = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

struct Content {
    let content:String
    let kind:Int
}
