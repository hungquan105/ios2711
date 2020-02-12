//
//  UserViewModel.swift
//  client
//
//  Created by Quân on 2/12/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation

let API = UserAPI()

struct UserViewModel {
    
    func Login(parameter:[String:String]?){
        API.Login(parameters: parameter, headers: nil)
    }
    
}
