//
//  GameDetailController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/20.
//

import UIKit
import AVKit

class GameDetailController: BaseViewController {
    
    /// scrollView
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        return scrollView
    }()
    
    /// 介绍视频
    fileprivate lazy var avPlayerVC: AVPlayerViewController = {
        let avPlayerVC = AVPlayerViewController()
        avPlayerVC.view.frame = CGRect(x: 0, y: Macro.size.margin+Macro.size.statusBarHeight+Macro.size.navBarHeight, width: view.bounds.width, height: Macro.size.adHeight)
        
        let avPlayer = AVPlayer(url: URL(string: "https://media.st.dl.pinyuncloud.com/steam/apps/256722040/movie480.mp4?t=1530920121")!)
        avPlayerVC.player = avPlayer
        
        return avPlayerVC
    }()
    
    /// 游戏简介
    fileprivate lazy var gameDesc: UILabel = {
        let gameDesc = UILabel()
        gameDesc.font = Macro.font.headline
        gameDesc.text = "20XX是一款你可以和朋友一起玩的roguelike类动作平台游戏。在不停变化的关卡里跳跃射击，以超棒新能力，为了拯救全人类，与强大的boss作战！\n游戏名称：20XX英文名称：20XX\n游戏类型：动作冒险类(ACT)游戏\n游戏制作：Batterystaple Games/Fire Hose Games\n游戏发行：Batterystaple Games\n游戏平台：PC发售时间：2017年8月16日"
        gameDesc.numberOfLines = 0
        return gameDesc
    }()
    
    /// 游戏截图
    fileprivate lazy var gameImages: UIView = {
        let gameImages = UIView()
        gameImages.backgroundColor = .cyan
        return gameImages
    }()
    
    /// 系统需求
    fileprivate lazy var gameRequirement: UILabel = {
        let gameRequirement = UILabel()
        gameRequirement.font = Macro.font.headline
        gameRequirement.text = "最低配置:\n操作系统: Windows XP\n处理器: 单核处理器或更好（2009+）\n内存: 1024 MB RAM\n显卡: 任何在2009年或之后推出的卡\nDirectX 版本: 9.0c\n存储空间: 需要 1 GB 可用空间\n附注事项: 笔记本电及用户：某些笔记本电脑默认使用集成GPU来运行20XX（而没有用你的好GPU）。我们强烈建议你使用独立显卡来运行20XX。\n推荐配置:\n处理器: 双核处理器或更好（2011+）\n显卡: 任何在最近五年推出的产品\nDirectX 版本: 9.0c"
        gameRequirement.numberOfLines = 0
        return gameRequirement
    }()
    
    /// 资源地址
    fileprivate lazy var gameResource: UILabel = {
        let gameResource = UILabel()
        gameResource.font = Macro.font.headline
        gameResource.attributedText = "<p>解压码/激活码：633282 </p><br /><p>百度网盘 提取码：o3kh</p>".htmlToAttributedString
        gameResource.numberOfLines = 0
        return gameResource
    }()
    
    static func openGameDetail(objectId: String? = nil) {
        let gameDetail = GameDetailController(objectId: objectId)
        UIApplication.getTopViewController()?.navigationController?.pushViewController(gameDetail, animated: true)
    }
    
    init(objectId: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "20XX"
        
    }
    
}

extension GameDetailController {
    
    /// 构建页面
    fileprivate func createPage() {
        view.addSubview(scrollView)
        
        addChild(avPlayerVC)
        scrollView.addSubview(avPlayerVC.view)
        
        scrollView.addSubview(gameDesc)
        gameDesc.snp.makeConstraints { make in
            make.top.equalTo(Macro.size.margin+avPlayerVC.view.frame.maxY)
            make.left.equalToSuperview()
            make.right.equalTo(view)
        }
        
        scrollView.addSubview(gameImages)
        gameImages.snp.makeConstraints { make in
            make.top.equalTo(gameDesc.snp.bottom).offset(Macro.size.margin)
            make.left.equalToSuperview()
            make.right.equalTo(view)
        }
        
        scrollView.addSubview(gameRequirement)
        gameRequirement.snp.makeConstraints { make in
            make.top.equalTo(gameImages.snp.bottom).offset(Macro.size.margin)
            make.left.equalToSuperview()
            make.right.equalTo(view)
        }
        
        scrollView.addSubview(gameResource)
        gameResource.snp.makeConstraints { make in
            make.top.equalTo(gameRequirement.snp.bottom).offset(Macro.size.margin)
            make.left.equalToSuperview()
            make.right.equalTo(view)
        }
    }
    
}

