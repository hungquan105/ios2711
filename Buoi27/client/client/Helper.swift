//
//  Helper.swift
//  client
//
//  Created by Quân on 2/17/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import Foundation
import UIKit
import DKImagePickerController

struct Helper {
    
    static let shared = Helper()
    
    func showImagePicker(vc: UIViewController, completion:@escaping (_ images: [UIImage])->Void){
        let picker = DKImagePickerController()
        picker.didSelectAssets = { (assets: [DKAsset]) in
            var images = [UIImage]()
            for item in assets {
                item.fetchImage(with: CGSize(width: 300, height: 300)) { (img, info) in
                    if let img = img {
                        images.append(img)
                    }
                }
            }
            completion(images)
        }
        vc.present(picker, animated: true, completion: nil)
    }
    
}
