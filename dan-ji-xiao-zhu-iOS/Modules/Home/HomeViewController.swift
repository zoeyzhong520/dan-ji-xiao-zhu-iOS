//
//  HomeViewController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/14.
//

import UIKit

class HomeViewController: BaseViewController {
    
    /// 自定义导航栏
    fileprivate lazy var navBar: DJXZNavBar = {
        let navBar = DJXZNavBar {
            print("导航栏右侧按钮点击")
        }
        return navBar
    }()
    
    /// Tabs
    fileprivate lazy var tabs: DJXZTabs = {
        let tabs = DJXZTabs(frame: CGRect(x: 0, y: Macro.size.statusBarHeight+Macro.size.navBarHeight, width: Macro.size.screenWidth, height: Macro.size.navBarHeight)) { tabIndex in
            print("Tab点击:\(tabIndex)")
        }
        return tabs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension HomeViewController {
    
    /// 构造页面
    fileprivate func createPage() {
        view.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        view.addSubview(tabs)
    }
 
}
