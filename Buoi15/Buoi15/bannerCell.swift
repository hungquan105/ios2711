//
//  bannerCell.swift
//  Buoi15
//
//  Created by Quân on 1/3/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit

class bannerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var timer = Timer()
    
    var arrImg:[UIImage] = [#imageLiteral(resourceName: "JACK"),#imageLiteral(resourceName: "MIN"),#imageLiteral(resourceName: "AMEE"),#imageLiteral(resourceName: "LOU-HOANG"),#imageLiteral(resourceName: "CHI-PU"),]
    var counter = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        collectionView.dataSource = self
//        collectionView.delegate = self
        pageControl.numberOfPages = arrImg.count
//        pageControl.currentPage = counter
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changImg), userInfo: nil, repeats: true)
//        DispatchQueue.main.sync {
//
//        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func changImg(){
        if counter < arrImg.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        }
        else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            //counter = 1
        }
    }

}
extension bannerCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerItemCell", for: indexPath) as! bannerItemCell
        cell.img.image = arrImg[indexPath.row]
        return cell
    }
    
    
}
