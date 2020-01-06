//
//  ProductCell.swift
//  Buoi15
//
//  Created by Quân on 1/3/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    // collectionView
    
    //
    var didChangeScreen:((_ id:String)->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProductCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductItemCell", for: indexPath) as! ProductItemCell
        cell.img.image = arrProduct[indexPath.item].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrProduct[indexPath.item].id)
  
        if self.didChangeScreen != nil {
            self.didChangeScreen(arrProduct[indexPath.item].id)
        }
         
    }
    
    

}
