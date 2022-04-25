//
//  GameADController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/18.
//

import UIKit

class GameADController: GameBaseController {
    
    /// 轮播图
    fileprivate lazy var djxzCarousel: DJXZCarousel = {
        let djxzCarousel = DJXZCarousel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 130), data: [["title": "生化危机8：村庄/Resident Evil Village（豪华版）", "image": "https://media.st.dl.pinyuncloud.com/steam/apps/1196590/header.jpg?t=1644282152"], ["title": "兽人必须死2/Orcs Must Die 2", "image": "https://media.st.dl.pinyuncloud.com/steam/apps/201790/header.jpg?t=1599675813"], ["title": "求生之路2/Left 4 Dead 2（整合背水一战DLC）", "image": "https://media.st.dl.pinyuncloud.com/steam/apps/550/header.jpg?t=1601578341"], ["title": "火影忍者：究极忍者风暴4（更新 V1.09）", "image": "https://media.st.dl.pinyuncloud.com/steam/apps/349040/header.jpg?t=1611701005"]]) { imageIndex in
            print("点击的图片序号：\(imageIndex)")
            
            GameDetailController.openGameDetail(objectId: "wsxedc")
        }
        return djxzCarousel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 继续执行定时器
        djxzCarousel.playTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)  
        
        // 暂停定时器
        djxzCarousel.pauseTimer()
    }
    
}

extension GameADController {
    
    /// 构建页面
    fileprivate func createPage() {
        tableView.tableHeaderView = djxzCarousel
    }
    
}
