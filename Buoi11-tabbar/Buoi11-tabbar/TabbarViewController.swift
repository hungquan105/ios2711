//
//  TabbarViewController.swift
//  Buoi11-tabbar
//
//  Created by Quân on 12/20/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

let Main_Storyboard = UIStoryboard(name: "Main", bundle: nil)

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
    }
    
    func setupTabbar(){
        
        // xac dinh man hinh
        let Red = Main_Storyboard.instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
        Red.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1000)
        let NaviRed = BaseNaviViewController(rootViewController: Red)
        
        let Yellow = Main_Storyboard.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        Yellow.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2000)
        let NaviYellow = BaseNaviViewController(rootViewController: Yellow)
        
        let Green = Main_Storyboard.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        Green.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3000)
        let NaviGreen = BaseNaviViewController(rootViewController: Green)
        
        let Purple = Main_Storyboard.instantiateViewController(withIdentifier: "PurpleViewController") as! PurpleViewController
        Purple.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 4000)
        let NaviPurple = BaseNaviViewController(rootViewController: Purple)
        // dua vao mang tabbar
        self.viewControllers = [NaviRed, NaviYellow, NaviGreen, NaviPurple]
    }

}
