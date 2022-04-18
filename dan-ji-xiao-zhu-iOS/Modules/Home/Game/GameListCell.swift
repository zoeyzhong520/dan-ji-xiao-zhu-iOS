//
//  GameListCell.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/18.
//

import UIKit

class GameListCell: UITableViewCell {
    
    /// 游戏封面图
    fileprivate lazy var gameImage: UIImageView = {
        let gameImage = UIImageView()
        gameImage.contentMode = .scaleToFill
        gameImage.backgroundColor = .lightGray
        gameImage.kf.setImage(with: URL(string: "https://images.ali213.net/picfile/pic/2021/11/12/2021111240842112.jpg"))
        return gameImage
    }()
    
    /// 游戏标题
    fileprivate lazy var gameTitle: UILabel = {
        let gameTitle = UILabel()
        gameTitle.font = Macro.font.searchBar
        gameTitle.numberOfLines = 2
        gameTitle.text = "侠盗猎车手/GTA/1/2/3/怀旧系列（罪恶都市，圣安地列斯）"
        return gameTitle
    }()
    
    /// 游戏简介
    fileprivate lazy var gameDesc: UILabel = {
        let gameDesc = UILabel()
        gameDesc.font = Macro.font.tableRowSubline
        gameDesc.numberOfLines = 3
        gameDesc.text = "PC版《侠盗猎车手：罪恶都市》（Grand Theft Auto: Vice City，后文简称VC）这款游戏在许多方面都要好于其前作《侠盗猎车手III》（GTA3），而且在技术上也要领先于几个月前在PS2上发布的VC原作。类似PC版的GTA3，PC版VC与PS2版就内容而言完全一样。然而PC版VC确实提供了更好的视觉效果和操纵方式，缩短了读取时间，去掉了了一些华而不实的东西。"
        return gameDesc
    }()
    
    /// GameListCell的高度
    static let gameListCellHeight: CGFloat = 110
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createPage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GameListCell {
    
    /// 构建页面
    fileprivate func createPage() {
        contentView.addSubview(gameImage)
        gameImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 115, height: 78))
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }
        
        contentView.addSubview(gameTitle)
        gameTitle.snp.makeConstraints { make in
            make.left.equalTo(gameImage.snp.right).offset(16)
            make.right.equalTo(-16)
            make.topMargin.equalTo(gameImage)
        }
        
        contentView.addSubview(gameDesc)
        gameDesc.snp.makeConstraints { make in
            make.leftMargin.equalTo(gameTitle)
            make.right.equalTo(-16)
            make.bottomMargin.equalTo(gameImage)
            
        }
    }
    
}
