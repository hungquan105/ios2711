//
//  UserModel.swift
//  client
//
//  Created by Quân on 2/12/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation

public struct Response:Codable {

        public var data : Datum
        public var message : String
        public var result : Bool
        
}

public struct Datum:Codable {

        public var name : String
        public var phone : String
        
}
