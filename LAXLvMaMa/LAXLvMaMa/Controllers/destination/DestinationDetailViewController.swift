//
//  DestinationDetailViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/27.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class DestinationDetailViewController: BaseViewController {
    
    var urlStr = URL_STR_DESTINATION_DETAIL
    var itemTitle = ""
    var model: DestinationModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = model?.keyword
        if model?.back_word1 != nil && model?.object_id != nil {
            urlStr += (model?.back_word1)! + (model?.object_id)!
        }
        
        var frame = self.view.bounds
        frame.size.height -= 44
        let web = UIWebView.init(frame: frame)
        web.loadRequest(URLRequest.init(url: URL.init(string: urlStr)!))
        self.view.addSubview(web)
        
    }
    
}
