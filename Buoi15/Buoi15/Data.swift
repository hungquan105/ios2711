//
//  Data.swift
//  Buoi15
//
//  Created by Quân on 1/3/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation
import UIKit

struct Root:Codable {
    var category:[Category]
    var product:[Product]
}

struct Category:Codable {
    var id:String
    var name:String
}

public struct Product:Codable {

        public var id : String
        public var image : String
        public var name : String
        public var quantity : Int
        public var thongso : Thongso
        
}

public struct Thongso:Codable {

        public var camera : String
        public var ram : String
        public var rom : String
        
}

var arrProduct:[Product] = []
//= [
//    Product(id: "1", name: "iPhone 8", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
//    Product(id: "4", name: "iPhone X", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
//    Product(id: "9", name: "iPhone 11", image: #imageLiteral(resourceName: "apple-iphone-11-1564393153"), quantity: 1),
//]

//var TheThao:[TheThao] = []
//var ThoiTrang:[ThoiTrang] = []
var Cart:[Product] = []
