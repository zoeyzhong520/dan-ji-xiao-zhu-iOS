//
//  GameBaseController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/18.
//

import UIKit

class GameBaseController: BaseViewController {
    
    /// TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GameListCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        return tableView
    }()
    
    /// CellReuseIdentifier
    fileprivate let cellReuseIdentifier = "CellReuseIdentifier"
    
    init(title: String? = nil, type: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        createPage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
        
    }
    
}

extension GameBaseController {
    
    /// 构建页面
    fileprivate func createPage() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-Macro.size.navBarHeight-Macro.size.searchBarHeight-(Macro.size.statusBarHeight > 20 ? 20 : 0))
        }
    }
    
}

extension GameBaseController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Common.tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? GameListCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GameListCell.gameListCellHeight
    }
    
}
