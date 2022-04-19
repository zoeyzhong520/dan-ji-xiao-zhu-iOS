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
        let navBar = DJXZNavBar(frame: CGRect(x: 0, y: 0, width: Macro.size.screenWidth, height: Macro.size.searchBarHeight+Macro.size.statusBarHeight), style: .home) {
            print("点击右侧按钮")
        }
        return navBar
    }()
    
    /// Tabs
    fileprivate lazy var tabs: DJXZTabs = {
        let tabs = DJXZTabs(frame: CGRect(x: 0, y: navBar.frame.maxY, width: Macro.size.screenWidth, height: Macro.size.navBarHeight)) { [unowned self] tabIndex in
            self.pageViewController.setViewControllers([self.viewControllers[tabIndex]], direction: tabIndex > tagOfViewInViewController() ? .forward : .reverse, animated: true)
        }
        return tabs
    }()
    
    /// 创建UIPageViewController
    fileprivate lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewController.OptionsKey.interPageSpacing: NSNumber(value: 0)])
        pageViewController.view.frame = CGRect(x: 0, y: tabs.frame.maxY, width: Macro.size.screenWidth, height: Macro.size.screenHeight-Macro.size.statusBarHeight-Macro.size.navBarHeight*2-Macro.size.tabBarHeight)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        for (index, item) in Common.tabs.enumerated() {
            if (index == 0) {
                viewControllers.append(GameADController.init(title: item["title"] ?? "", type: item["type"] ?? ""))
            } else {
                viewControllers.append(GameListController.init(title: item["title"] ?? "", type: item["type"] ?? ""))
            }
            // 给控制器中的view分别设置tag，便于区分
            viewControllers[index].view.tag = index
        }
        
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: false)
        
        return pageViewController
    }()
    
    /// 初始化UIPageViewController要展示的控制器
    fileprivate var viewControllers: [GameBaseController] = []
    
    /// 选中的子控制器下标
    fileprivate var currentPage = 0
    
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
        // 导航栏
        view.addSubview(navBar)
        
        // Tabs
        view.addSubview(tabs)
        
        // 分页控制器
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    /// 自定义方法，获取viewController的页码
    fileprivate func indexOfViewController(viewController: GameBaseController?) -> Int {
        guard let tmpViewController = viewController, let currentPageIndex = viewControllers.firstIndex(of: tmpViewController) else {
            return 0
        }
        return currentPageIndex
    }
    
    /// 获取控制器里的view的tag
    fileprivate func tagOfViewInViewController() -> Int {
        guard let tag = pageViewController.viewControllers?.first?.view.tag else { return 0 }
        return tag
    }
    
}

extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // delegate
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            // 更新Tabs标签视图
            tabs.activeTabIndex = tagOfViewInViewController()
        }
    }
    
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }
    
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
        return .portrait
    }
    
    // dataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        currentPage = indexOfViewController(viewController: viewController as? GameBaseController)
        
        if currentPage == 0 {
            return nil
        }
        
        currentPage = currentPage-1
        
        return viewControllers[currentPage]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        currentPage = indexOfViewController(viewController: viewController as? GameBaseController)
        
        if currentPage == viewControllers.count-1 {
            return nil
        }
        
        currentPage = currentPage+1
        
        return viewControllers[currentPage]
    }
    
}
