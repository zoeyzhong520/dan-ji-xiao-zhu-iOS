//
//  DJXZCarousel.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/19.
//

import UIKit

class DJXZCarousel: UIView {
    
    /// 滚动视图
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = true
        scrollView.delegate = self
        scrollView.backgroundColor = .purple
        return scrollView
    }()
    
    /// 图片数组
    fileprivate var images: [String] = []
    
    /// 当前滑动到的图片位置下标
    fileprivate var currentIndex: Int = 0
    
    /// 创建的定时器
    fileprivate var timer: Timer?
    
    init(frame: CGRect, images: [String]? = nil) {
        super.init(frame: frame)
        
        self.images = images ?? []
        
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DJXZCarousel {
    
    /// 构建页面
    fileprivate func createPage() {
        addSubview(scrollView)
        
        // 对images数组进行处理：数组头部插入最后一张图片，数组尾部插入第一张图片
        let firstItem = images.first ?? ""
        let lastItem = images.last ?? ""
        
        if images.count > 1 {
            images.insert(lastItem, at: 0)
            images.append(firstItem)
            
            // 初始化要滚动到第二张图片的位置，因为第一张图片实际是最后一张
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth, y: 0), animated: false)
        }
        
        // 添加图片
        for (index, item) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index)*Macro.size.screenWidth, y: 0, width: Macro.size.screenWidth, height: bounds.size.height))
            imageView.contentMode = .scaleAspectFill
            imageView.kf.setImage(with: URL(string: item))
            imageView.backgroundColor = Macro.color.backGray
            scrollView.addSubview(imageView)
        }
        
        // 更新scrollView的contentSize
        scrollView.contentSize = CGSize(width: CGFloat(images.count)*Macro.size.screenWidth, height: bounds.size.height)
    }
    
}

extension DJXZCarousel: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x/Macro.size.screenWidth)
        print("currentIndex:\(currentIndex)")
        
        // 滚动到第一张
        if currentIndex == 0 {
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth*CGFloat(images.count-2), y: 0), animated: false)
        }
        
        // 滚动到最后一张
        if currentIndex == images.count-1 {
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth, y: 0), animated: false)
        }
        
    }
    
}
