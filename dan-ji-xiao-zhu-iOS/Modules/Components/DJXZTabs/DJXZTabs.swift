//
//  DJXZTabs.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/16.
//

import UIKit

class DJXZTabs: UIView {
    
    /// 标题数组
    fileprivate var titles: [[String: String]] = []
    
    /// 标题文本宽度数组
    fileprivate var tabTextWidthArray: [CGFloat] = []
    
    /// 指示器宽度
    fileprivate let indicatorWidth: CGFloat = 20
    
    /// 指示器高度
    fileprivate let indicatorHeight: CGFloat = 3
    
    /// Tab点击事件闭包
    fileprivate var tabClick: DJXZIntClosure?
    
    /// 滚动视图
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Macro.size.screenWidth, height: Macro.size.navBarHeight))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.bounces = false
        return scrollView
    }()
    
    /// 指示器
    fileprivate lazy var indicatorLine: UIView = {
        let indicatorLine = UIView(frame: .zero)
        indicatorLine.backgroundColor = Macro.color.primary
        indicatorLine.layer.cornerRadius = indicatorHeight/2
        return indicatorLine
    }()
    
    init(frame: CGRect, titles: [[String: String]]? = nil, tabClick: DJXZIntClosure? = nil) {
        super.init(frame: frame)
        self.titles = titles ?? Common.tabs
        self.tabClick = tabClick
        
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DJXZTabs {
    
    /// 构建页面
    fileprivate func createPage() {
        addSubview(scrollView)
        
        /// 计算标签文本宽度和
        var tabTextWidthSum: CGFloat = 0
        
        for (index, item) in titles.enumerated() {
            // 计算文本高度
            let labelWidth = String.getTextRectSize(item["title"] ?? "", font: Macro.font.subhead, size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: Macro.size.navBarHeight)).width
            tabTextWidthSum += (labelWidth+8*2)
            tabTextWidthArray.append(labelWidth+8*2)
            
            let label = UILabel(frame: .zero)
            label.text = item["title"] ?? ""
            label.font = Macro.font.subhead
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabItemClick(_:))))
            label.tag = index
            scrollView.addSubview(label)
            
            label.snp.makeConstraints { make in
                make.width.equalTo(labelWidth+8*2)
                make.height.equalToSuperview()
                make.left.equalTo(CGFloat(index)*(labelWidth+8*2))
            }
        }
        
        // 设置scrollView的contentSize以支持滑动
        scrollView.contentSize = CGSize(width: tabTextWidthSum, height: Macro.size.navBarHeight)
        
        scrollView.addSubview(indicatorLine)
        indicatorLine.snp.makeConstraints { make in
            make.height.equalTo(indicatorHeight)
            make.width.equalTo(indicatorWidth)
            make.top.equalTo(Macro.size.navBarHeight-indicatorHeight)
            make.left.equalTo(((tabTextWidthArray.first ?? 16)-indicatorWidth)/2)
        }
    }
    
    /// Tab点击事件
    @objc fileprivate func tabItemClick(_ gesture: UITapGestureRecognizer) {
        guard let index = gesture.view?.tag else { return }
        
        // 计算距左侧的间距
        var leftMargin: CGFloat = ((tabTextWidthArray.first ?? 16)-indicatorWidth)/2
        
        for i in 0..<index {
            leftMargin += tabTextWidthArray[i]
        }
        
        UIView.animate(withDuration: 0.2) { [unowned self] in
            self.indicatorLine.snp.updateConstraints { make in
                make.left.equalTo(leftMargin)
            }
            // 告知父类控件绘制，不添加这行的代码动画将不生效
            self.superview?.layoutIfNeeded()
        }
        
        // 设置scrollView的setContentOffset
        scrollView.setContentOffset(CGPoint(x: leftMargin >= Macro.size.screenWidth/2 ? (leftMargin-Macro.size.screenWidth/2) : 0, y: 0), animated: true)
        
        // 最后一页Tab
        if (scrollView.contentSize.width-leftMargin <= Macro.size.screenWidth/2) {
            scrollView.setContentOffset(CGPoint(x: scrollView.contentSize.width-Macro.size.screenWidth, y: 0), animated: true)
        }
        
        tabClick?(index)
    }
    
}
