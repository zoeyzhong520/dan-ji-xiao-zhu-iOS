//
//  BuzzInformationCell.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/24.
//

import UIKit

class BuzzInformationCell: UITableViewCell {
    
    /// 容器
    fileprivate lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = Macro.color.backWhite
        return container
    }()
    
    /// 资讯封面图
    fileprivate lazy var buzzImage: UIImageView = {
        let buzzImage = UIImageView()
        buzzImage.layer.masksToBounds = true
        buzzImage.layer.cornerRadius = Macro.size.borderRadius
        buzzImage.contentMode = .scaleAspectFill
        buzzImage.backgroundColor = Macro.color.backGray
        buzzImage.kf.setImage(with: URL(string: "http://img4.yxdimg.com/2021/10/1/2293084e-944d-471f-bace-01d8d7d645aa.jpg"))
        return buzzImage
    }()
    
    /// 资讯标题
    fileprivate lazy var buzzTitle: UILabel = {
        let buzzTitle = UILabel()
        buzzTitle.font = Macro.font.caption1
        buzzTitle.numberOfLines = 2
        buzzTitle.text = "《柯娜：精神之桥》评测：舒适且温馨的灵魂之旅"
        return buzzTitle
    }()
    
    /// BuzzInformationCell的高度
    static let cellHeight: CGFloat = Macro.size.adHeight+Macro.size.margin+40
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createPage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BuzzInformationCell {
    
    /// 构建页面
    fileprivate func createPage() {
        contentView.backgroundColor = Macro.color.backGray
        
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: Macro.size.margin, left: Macro.size.margin, bottom: 0, right: Macro.size.margin))
        }
        
        container.addSubview(buzzImage)
        buzzImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: Macro.size.screenWidth-Macro.size.margin*2, height: Macro.size.adHeight))
            make.centerX.equalToSuperview()
        }
        
        container.addSubview(buzzTitle)
        buzzTitle.snp.makeConstraints { make in
            make.top.equalTo(buzzImage.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
    }
    
}

