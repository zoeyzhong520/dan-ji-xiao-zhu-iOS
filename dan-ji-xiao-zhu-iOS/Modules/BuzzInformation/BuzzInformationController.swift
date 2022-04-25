//
//  BuzzInformation.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/14.
//

import UIKit

class BuzzInformationController: BaseViewController {
    
    /// TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: Macro.size.statusBarHeight+Macro.size.navBarHeight, width: Macro.size.screenWidth, height: Macro.size.screenHeight-Macro.size.statusBarHeight-Macro.size.navBarHeight-Macro.size.tabBarHeight), style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BuzzInformationCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        return tableView
    }()
    
    /// CellReuseIdentifier
    fileprivate let cellReuseIdentifier = "CellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
    }
    
}

extension BuzzInformationController {
    
    /// 构建页面
    fileprivate func createPage() {
        view.addSubview(tableView)
    }
    
}

extension BuzzInformationController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Common.tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? BuzzInformationCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BuzzInformationCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 打开资讯详情
        
    }
    
}
