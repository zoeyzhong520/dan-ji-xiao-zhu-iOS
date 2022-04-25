//
//  ViewController.swift
//  dan-ji-xiao-zhu-iOS
//
//  Created by Joe on 2022/4/14.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createPage()
        
    }


}

extension BaseViewController {
    
    /// 构建页面
    fileprivate func createPage() {
        view.backgroundColor = Macro.color.backGray
    }
    
}

