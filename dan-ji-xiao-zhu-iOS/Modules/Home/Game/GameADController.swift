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
        let djxzCarousel = DJXZCarousel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 130), images: ["https://media.st.dl.pinyuncloud.com/steam/apps/1196590/header.jpg?t=1644282152", "https://media.st.dl.pinyuncloud.com/steam/apps/201790/header.jpg?t=1599675813", "https://media.st.dl.pinyuncloud.com/steam/apps/550/header.jpg?t=1601578341", "https://media.st.dl.pinyuncloud.com/steam/apps/349040/header.jpg?t=1611701005"])
        return djxzCarousel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
        
    }
    
}

extension GameADController {
    
    /// 构建页面
    fileprivate func createPage() {
        tableView.tableHeaderView = djxzCarousel
    }
    
}
