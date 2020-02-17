//
//  PhotoViewController.swift
//  client
//
//  Created by Quân on 2/17/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrPhoto:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Choose(_ sender: Any) {
        Helper.shared.showImagePicker(vc: self) { (images) in
            self.arrPhoto.append(contentsOf: images)
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func Upload(_ sender: Any) {
        var dataImages: [Dictionary<String,Any>] = []
        self.arrPhoto.forEach { (img) in
            let convertImage = img.jpegData(compressionQuality: 0.5)
            dataImages.append([
                "key":"photos",
                "value":convertImage
            ])
        }
        RequestService.shared.uploadFile(url: "http://localhost:3000/photos/upload", dataImages: dataImages, objectType: BaseResponse.self) { (result, json, error) in
            if result {
                guard let model = json as? BaseResponse else {return}
                print(model.message)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
}

extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoItemCell", for: indexPath) as! PhotoItemCell
        cell.imgv.image = arrPhoto[indexPath.item]
        return cell
    }
    
}

struct BaseResponse:Codable {
    let result:Bool
    let message:String
}
