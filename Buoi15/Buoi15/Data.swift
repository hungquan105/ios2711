//
//  Data.swift
//  Buoi15
//
//  Created by Quân on 1/3/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation
import UIKit

struct Product {
    let id: String
    let name: String
    let image: UIImage
    var quantity: Int
}

var arrProduct:[Product] = [
    Product(id: "1", name: "iPhone 8", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
    Product(id: "4", name: "iPhone X", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
    Product(id: "9", name: "iPhone 11", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
]

//var TheThao:[TheThao] = []
//var ThoiTrang:[ThoiTrang] = []
var Cart:[Product] = []
