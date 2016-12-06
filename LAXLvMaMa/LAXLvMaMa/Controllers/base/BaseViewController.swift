//
//  BaseTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/25.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
//        self.tableView.tableFooterView = UIView.init()
        
        createItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    func createItems() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(self.returnAction))
    }
    
    func returnAction() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
