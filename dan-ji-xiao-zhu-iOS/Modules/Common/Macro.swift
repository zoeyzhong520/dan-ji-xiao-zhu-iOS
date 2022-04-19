//
//  Macro.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/15.
//

import UIKit
import SwiftyFitsize
import SnapKit
import Kingfisher

struct Macro {
    
    /// 字体(默认) Typography
    struct font {
        
        /// 1级标题
        static let title1 = UIFont.systemFont(ofSize: 28)~
        
        /// 2级标题
        static let title2 = UIFont.systemFont(ofSize: 22)~
        
        /// 3级标题
        static let title3 = UIFont.systemFont(ofSize: 20)~
        
        /// 标题，大字标题
        static let headline = UIFont.boldSystemFont(ofSize: 17)~
        
        /// Body
        static let body = UIFont.systemFont(ofSize: 17)~
        
        /// 插图编号
        static let callout = UIFont.systemFont(ofSize: 16)~
        
        /// 副标题
        static let subhead = UIFont.systemFont(ofSize: 15)~
        
        /// 脚注；补充说明
        static let footnote = UIFont.systemFont(ofSize: 13)~
        
        /// 1级说明文字
        static let caption1 = UIFont.systemFont(ofSize: 12)~
        
        /// 2级说明文字
        static let caption2 = UIFont.systemFont(ofSize: 11)~
        
        
        /// Nav Bar Title
        static let navBarTitle = UIFont.boldSystemFont(ofSize: 17)~
        
        /// Nav Bar Button
        static let navBarButton = UIFont.systemFont(ofSize: 17)~
        
        /// Search Bar
        static let searchBar = UIFont.systemFont(ofSize: 13.5)~
        
        /// Tab Bar Button
        static let tabBarButton = UIFont.systemFont(ofSize: 10)~
        
        /// Table Header
        static let tableHeader = UIFont.systemFont(ofSize: 12.5)~
        
        /// Table Row
        static let tableRow = UIFont.systemFont(ofSize: 16.5)~
        
        /// Table Row Subline
        static let tableRowSubline = UIFont.systemFont(ofSize: 12)~
        
        /// Table Footer
        static let tableFooter = UIFont.systemFont(ofSize: 12.5)~
        
        /// Action Sheets
        static let actionSheets = UIFont.systemFont(ofSize: 20)~
        
    }
    
    /// 尺寸
    struct size {
        
        /// 屏幕宽
        static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        
        /// 屏幕高
        static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
        
        /// 状态栏高度
        static let statusBarHeight: CGFloat = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        /// 导航栏高度
        static let navBarHeight: CGFloat = 44
        
        /// 搜索框高度
        static let searchBarHeight: CGFloat = 45
        
        /// TabBar高度
        static let tabBarHeight: CGFloat = UITabBarController().tabBar.frame.height
        
        /// 圆角值
        static let borderRadius: CGFloat = 3
        
    }
    
    /// 颜色
    struct color {
        
        /// 主题颜色
        static let primary = UIColor(red: 59/255, green: 144/255, blue: 208/255, alpha: 1.0)
        
        /// 背景白色
        static let backWhite = UIColor.white
        
        /// 背景灰色
        static let backGray = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        /// 字体黑色
        static let textBlack = UIColor.black
        
        /// 字体灰色
        static let textGray = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1.0)
        
        /// 边框颜色
        static let borderColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        
    }
    
}






