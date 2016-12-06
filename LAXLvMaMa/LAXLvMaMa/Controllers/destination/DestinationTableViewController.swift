//
//  DestinationTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/17.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class DestinationTableViewController: UIViewController {
    
    init(urlStr: String, delegate: DestinationViewControllerProtocol) {
        super.init(nibName: nil, bundle: nil)
        
        let tableView = DestinationTableView.init(urlStr: urlStr, frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tableView.viewdelegate = delegate
        self.view.addSubview(tableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
