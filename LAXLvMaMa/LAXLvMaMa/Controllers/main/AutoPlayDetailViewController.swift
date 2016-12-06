//
//  AutoPlayDetailViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/23.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class AutoPlayDetailViewController: BaseViewController {
    
    var urlStr = ""
    var itemTitle = ""
    var strArr = [URL_STR_MAIN_AUTOPLAY_DETAIL2_HTML, URL_STR_MAIN_AUTOPLAY_DETAIL3_HTML, URL_STR_MAIN_AUTOPLAY_DETAIL4_HTML, URL_STR_MAIN_AUTOPLAY_DETAIL5_HTML, URL_STR_MAIN_AUTOPLAY_DETAIL6_HTML, URL_STR_MAIN_AUTOPLAY_DETAIL7_HTML]
    
    init(index: Int, title: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.urlStr = strArr[index]
        self.itemTitle = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = itemTitle
        
        var frame = self.view.bounds
        frame.size.height += 49
        let web = UIWebView.init(frame: frame)
        web.loadRequest(URLRequest.init(url: URL.init(string: urlStr)!))
        self.view.addSubview(web)
        
    }
    
}
