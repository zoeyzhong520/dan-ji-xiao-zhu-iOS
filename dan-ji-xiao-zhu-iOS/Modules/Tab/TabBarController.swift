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
        
        createPage()
        adaptationNavBar()
        adaptationTabBar()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.title
    }
    
}

extension TabBarController {
    
    /// 构建页面
    func createPage() {
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
    
    /// 创建tabBarItem
    func setTabBarItem(viewController: UIViewController, tab: [String: String]) {
        
        if let title = tab["title"] {
            viewController.tabBarItem.title = title
        }
        
        if let image = tab["image"] {
            viewController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        }
        
        if let selectedImage = tab["selectedImage"] {
            viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        
    }
    
    /// TabBar适配
    func adaptationTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        if #available(iOS 15, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    /// NavBar适配
    func adaptationNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}
