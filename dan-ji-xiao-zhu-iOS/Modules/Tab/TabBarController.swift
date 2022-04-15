//
//  TabBarController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/14.
//

import UIKit

class TabBarController: UITabBarController {
    
    fileprivate let tabsArray = [
        ["title": "游戏推荐", "image": "icon_home", "selectedImage": "icon_home_selected"],
        ["title": "热评资讯", "image": "icon_buzzInfo", "selectedImage": "icon_buzzInfo_selected"],
        ["title": "我的", "image": "icon_mine", "selectedImage": "icon_mine_selected"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 首页
        let home = HomeViewController()
        setTabBarItem(viewController: home, tab: tabsArray[0])
        
        // 热评资讯
        let buzzInfo = BuzzInformationController()
        setTabBarItem(viewController: buzzInfo, tab: tabsArray[1])
        
        // 我的
        let mine = MineViewController()
        setTabBarItem(viewController: mine, tab: tabsArray[2])
        
        viewControllers = [home, buzzInfo, mine]
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.title
    }
    
    // 创建tabBarItem
    func setTabBarItem(viewController: UIViewController, tab: [String: String]) {
        
        if let title = tab["title"] {
            viewController.tabBarItem.title = title
        }
        
        if let image = tab["image"] {
            viewController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        }
        
        if let selectedImage = tab["selectedImage"] {
            print(selectedImage)
            viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        
    }
}
