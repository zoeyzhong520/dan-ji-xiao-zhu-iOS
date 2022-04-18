//
//  DJXZNavBar.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/16.
//

import UIKit

/// 导航栏样式枚举
enum DJXZNavBarStyle {
    /// 首页导航栏样式
    case home
    /// 搜索页导航栏样式
    case search
}

class DJXZNavBar: UIView {
    
    /// 搜索框
    fileprivate lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 8, y: Macro.size.statusBarHeight, width: Macro.size.screenWidth-Macro.size.searchBarHeight-8*3, height: Macro.size.searchBarHeight))
        searchBar.placeholder = "搜索"
        searchBar.searchBarStyle = .minimal
        searchBar.isUserInteractionEnabled = style == .search
        return searchBar
    }()
    
    /// 右侧按钮
    fileprivate lazy var rightBtn: UIButton = {
        let rightBtn = UIButton(frame: .zero)
        rightBtn.setTitle(style == .home ? "筛选" : "搜索", for: .normal)
        rightBtn.setTitleColor(.black, for: .normal)
        rightBtn.titleLabel?.font = Macro.font.navBarButton
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        return rightBtn
    }()
    
    /// 导航栏样式
    fileprivate var style: DJXZNavBarStyle = .home
    
    /// 右侧按钮点击事件闭包
    fileprivate var customClick: DJXZClosure?
    
    init(frame: CGRect, style: DJXZNavBarStyle = .home, customClick: DJXZClosure? = nil) {
        super.init(frame: frame)
        self.style = style
        self.customClick = customClick
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DJXZNavBar {
    
    /// 构造页面
    fileprivate func createPage() {
        addSubview(searchBar)
        
        addSubview(rightBtn)
        rightBtn.snp.makeConstraints { make in
            make.width.height.equalTo(Macro.size.searchBarHeight)
            make.top.equalTo(Macro.size.statusBarHeight)
            make.right.equalTo(-8)
        }
    }
    
    /// 右侧按钮点击
    @objc fileprivate func rightBtnClick() {
        customClick?()
    }
    
}

