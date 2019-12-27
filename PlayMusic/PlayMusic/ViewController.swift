//
//  ViewController.swift
//  PlayMusic
//
//  Created by Quân on 12/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrSongs:[Song] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrSongs = [
            Song(name: "Anh Nhà Ở Đâu Thế?", singer: "AMEE ft B RAY", link: "Anh-Nha-O-Dau-The-AMEE-B-Ray", avatar: #imageLiteral(resourceName: "AMEE")),
            Song(name: "Anh Ơi Ở Lại", singer: "Chi Pu ft Đạt G", link: "Anh-Oi-O-Lai-Chi-Pu-Dat-G", avatar: #imageLiteral(resourceName: "CHI-PU")),
            Song(name: "Bạc Phận", singer: "Jack ft K-ICM", link: "Bac-Phan-Jack-K-ICM", avatar: #imageLiteral(resourceName: "JACK")),
            Song(name: "Cảm Giác Lúc Ấy Sẽ Ra Sao", singer: "Lou-Hoàng", link: "Cam-Giac-Luc-Ay-Se-Ra-Sao-Lou-Hoang", avatar: #imageLiteral(resourceName: "LOU-HOANG")),
            Song(name: "Đừng Yêu Nữa Em Mệt Rồi", singer: "MIN", link: "Dung-Yeu-Nua-Em-Met-Roi-MIN", avatar: #imageLiteral(resourceName: "MIN")),
            Song(name: "Một Bước Yêu Vạn Dặm Đau", singer: "Mr-Sỉo", link: "Mot-Buoc-Yeu-Van-Dam-Dau-Mr-Siro", avatar: #imageLiteral(resourceName: "MR.SIRO")),
        ]
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.bindData(song: arrSongs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let playerVC = sb.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        playerVC.song = arrSongs[indexPath.row]
        self.navigationController?.pushViewController(playerVC, animated: true)
    }

}

struct Song {
    let name:String
    let singer:String
    let link:String
    let avatar:UIImage
}
