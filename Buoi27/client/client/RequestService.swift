//
//  RequestService.swift
//  client
//
//  Created by Quân on 2/12/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

typealias CompletionHandleJSON = (_ result:Bool, _ json:Any?, _ error:Error?)->Void

struct RequestService {
    
    static let shared = RequestService()
    
    func requestWith<T:Codable>(url:String, method: HTTPMethod, parameters:[String:String]?, headers:HTTPHeaders?, objectType: T.Type, complete:@escaping CompletionHandleJSON){
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers,
                   interceptor: nil).response { (response) in
                    switch response.result {
                    case .success(let data):
                        do {
                            let json = try JSONDecoder.init().decode(objectType/*Response.self*/, from: data!)
                            complete(true,json,nil)
                        } catch {
                            print("JSON error")
                            complete(false,data,nil)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        complete(false,nil,error)
                    }
        }
    }
    
    func uploadFile<T:Codable>(url:String, dataImages:[Dictionary<String,Any>]?, objectType:T.Type, complete:@escaping CompletionHandleJSON){
        AF.upload(multipartFormData: { (multipartFormData) in
            // convert images to data
            if let dataImages = dataImages {
                for dict in dataImages {
                    guard let key:String = dict["key"] as? String, let data:Data = dict["value"] as? Data else {return}
                    multipartFormData.append(data, withName: key, fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                }
            }
        }, to: url).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONDecoder.init().decode(objectType, from: data!)
                    complete(true,json,nil)
                } catch {
                    complete(false,data,nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                complete(false,nil,error)
            }
        }
    }
    
}
