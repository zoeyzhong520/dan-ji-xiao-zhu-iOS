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
    
    /// 页控件
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: bounds.size.height-pageControlHeight, width: bounds.size.width, height: pageControlHeight))
        pageControl.numberOfPages = data.count > 1 ? data.count-2 : data.count
        pageControl.backgroundColor = Macro.color.maskColor
        return pageControl
    }()
    
    /// 图片数组，[["title": "", "image": ""]]
    fileprivate var data: [[String: String]] = []
    
    /// 当前滑动到的图片位置下标
    fileprivate var currentIndex: Int = 0
    
    /// 创建的定时器
    fileprivate var timer: Timer!
    
    /// 图片切换频率
    fileprivate let interval: TimeInterval = 3.5
    
    /// 页控件高度
    fileprivate let pageControlHeight: CGFloat = Macro.size.navBarHeight/2
    
    /// 图片上面的文本标题高度
    fileprivate let imageTitleHeight: CGFloat = Macro.size.navBarHeight/2
    
    /// 点击图片执行的闭包
    fileprivate var customClick: DJXZIntClosure?
    
    init(frame: CGRect, data: [[String: String]]? = nil, customClick: DJXZIntClosure? = nil) {
        super.init(frame: frame)
        
        self.data = data ?? []
        self.customClick = customClick
        
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
        let firstItem = data.first ?? [:]
        let lastItem = data.last ?? [:]
        
        if data.count > 1 {
            data.insert(lastItem, at: 0)
            data.append(firstItem)
            
            // 初始化要滚动到第二张图片的位置，因为第一张图片实际是最后一张
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth, y: 0), animated: false)
        }
        
        // 添加图片
        for (index, item) in data.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index)*Macro.size.screenWidth, y: 0, width: Macro.size.screenWidth, height: bounds.size.height))
            imageView.contentMode = .scaleAspectFill
            imageView.kf.setImage(with: URL(string: item["image"] ?? ""))
            imageView.backgroundColor = Macro.color.backGray
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageClick(_:))))
            imageView.tag = index
            
            // 图片上面添加标题
            let labelView = UIView(frame: CGRect(x: 0, y: imageView.bounds.height-pageControlHeight-imageTitleHeight, width: imageView.bounds.width, height: imageTitleHeight))
            labelView.backgroundColor = Macro.color.maskColor
            imageView.addSubview(labelView)
            
            let label = UILabel(frame: CGRect(x: 16, y: 0, width: imageView.bounds.width-16*2, height: labelView.bounds.height))
            label.text = item["title"] ?? ""
            label.font = Macro.font.subhead
            label.textColor = Macro.color.textWhite
            label.isUserInteractionEnabled = true
            labelView.addSubview(label)
            
            scrollView.addSubview(imageView)
        }
        
        // 更新scrollView的contentSize
        scrollView.contentSize = CGSize(width: CGFloat(data.count)*Macro.size.screenWidth, height: bounds.size.height)
        
        addSubview(pageControl)
        
        createTimer()
    }
    
    /// 点击轮播的图片
    @objc fileprivate func imageClick(_ gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        
        customClick?(data.count > 1 ? tag-1 : tag)
    }
    
    /// 更新pageControl的currentPage
    fileprivate func reloadPageControl() {
        pageControl.currentPage = data.count > 1 ? currentIndex-1 : currentIndex
    }
    
    /// 创建定时器
    fileprivate func createTimer() {
        timer = Timer(timeInterval: interval, repeats: true, block: { [unowned self] timer in
            
            self.currentIndex += 1
            
            self.reloadPageControl()
                        
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(self.currentIndex)*Macro.size.screenWidth, y: 0), animated: true)
            
            if self.currentIndex == self.data.count-1 {
                // 自动滑动到最后一张图片的时候，设置一个延迟执行，悄悄把currentIndex设置为第一张图片的位置，因为第0张图片实际是最后一张图片
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    self.scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth, y: 0), animated: false)
                    
                    self.currentIndex = 1
                    
                    self.reloadPageControl()
                }
            }
            
        })
        // 设置宽容度
        timer.tolerance = 0.2
        // 添加到当前RunLoop，mode为默认
        RunLoop.current.add(timer, forMode: .default)
        // 开始计时
        timer.fire()
    }
    
    /// 暂停定时器
    func pauseTimer() {
        if timer.isValid {
            timer.fireDate = Date.distantFuture
        }
    }
    
    /// 继续执行定时器
    func playTimer() {
        if timer.isValid {
            // 若干秒后开启
            timer.fireDate = Date(timeIntervalSinceNow: interval)
        }
    }
    
}

extension DJXZCarousel: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x/Macro.size.screenWidth)
        
        // 滚动到第一张
        if currentIndex == 0 {
            currentIndex = data.count > 1 ? data.count-2 : data.count-1
            
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth*CGFloat(data.count-2), y: 0), animated: false)
        }
        
        // 滚动到最后一张
        if currentIndex == data.count-1 {
            currentIndex = 1
            
            scrollView.setContentOffset(CGPoint(x: Macro.size.screenWidth, y: 0), animated: false)
        }
        
        reloadPageControl()
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        pauseTimer()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        playTimer()
    }
    
}
