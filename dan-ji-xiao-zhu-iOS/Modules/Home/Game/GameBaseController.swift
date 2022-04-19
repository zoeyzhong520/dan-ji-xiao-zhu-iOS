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
    
    /// 标题
    fileprivate var _title = ""
    
    /// 游戏类型
    fileprivate var _type = ""
    
    init(title: String? = nil, type: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        _title = title ?? ""
        _type = type ?? ""
        
        createPage()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension GameBaseController {
    
    /// 构建页面
    fileprivate func createPage() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(_type == "ALL" ? 16 : 0)
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
