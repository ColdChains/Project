//
//  HeaderTableView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/18.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    var subview: UIView?
}

class HeaderTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var cellId = "HeaderTableViewCell"
    let width = UIScreen.main.bounds.size.width
    let headerHeight: CGFloat = 360 + 520 + 60 + 30
    
    var headerView: UIView!
    var autoViewH: AutoPlayView!
    var autoViewV: AutoPlayViewVertical!
    var headerViewOne: HeaderCollectionViewOne!
    var headerViewTwo: HeaderCollectionViewTwo!
    
    var hotrecommondView: HotRecommendView!
    var phoneenjoyView: PhoneEnjoyCollectionView!
    var limitTimeView: LimitTimeCollectionView!
    
    var viewdelegate: MainViewControllerProtocol?
    
    init(delegate: MainViewControllerProtocol) {
        self.viewdelegate = delegate
        
        let frame = CGRect.init(x: 0, y: 64, width: width, height: headerHeight)
        super.init(frame: frame, style: .plain)
        
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clear
        
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        self.register(HeaderTableViewCell.self, forCellReuseIdentifier: cellId)
        
        self.createView()
        self.setViewDelegate()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.setHeaderAndFooterView()
        hotrecommondView = HotRecommendView.init(CGRect.init(x: 0, y: 0, width: width, height: 200))
        phoneenjoyView = PhoneEnjoyCollectionView.init(CGRect.init(x: 0, y: 0, width: width, height: 140))
        limitTimeView = LimitTimeCollectionView.init(CGRect.init(x: 0, y: 0, width: width, height: 180))
    }
    
    func setHeaderAndFooterView() {
        
        headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: 360))
        headerView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        autoViewH = AutoPlayView.init(CGRect.init(x: 0, y: 0, width: width, height: 100))
        headerView.addSubview(autoViewH)
        
        headerViewOne = HeaderCollectionViewOne.init(CGRect.init(x: 0, y: 100, width: width, height: 120))
        headerView.addSubview(headerViewOne)
        headerViewTwo = HeaderCollectionViewTwo.init(CGRect.init(x: 0, y: 220, width: width, height: 100))
        headerView.addSubview(headerViewTwo)
        
        autoViewV = AutoPlayViewVertical.init(CGRect.init(x: 5, y: 320, width: width - 10, height: 35))//剩5为空隙
        headerView.addSubview(autoViewV)
        self.tableHeaderView = headerView
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 30))
        label.backgroundColor = UIColor.init(white: 0.99, alpha: 1)
        label.text = "--发现更多精彩--"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        self.tableFooterView = label
        
    }
    
    func refreshDatas() {
        autoViewH.requestData()
        autoViewV.requestData()
    }
    
    func setViewDelegate() {
        
        autoViewH.viewdelegate = viewdelegate
        autoViewV.viewdelegate = viewdelegate
        headerViewOne.viewdelegate = viewdelegate
        headerViewTwo.viewdelegate = viewdelegate
        
        hotrecommondView.viewdelegate = viewdelegate
        phoneenjoyView.viewdelegate = viewdelegate
        limitTimeView.viewdelegate = viewdelegate
        
    }
    
    // MARK: - SystemTableView Protocol Foundtion
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HeaderTableViewCell
        cell.subview?.removeFromSuperview()
        cell.selectionStyle = .none
        //cell.backgroundColor = UIColor.green
        
        switch(indexPath.section) {
        case 0:
            cell.subview = hotrecommondView
            break
        case 1:
            cell.subview = phoneenjoyView
            break
        case 2:
            cell.subview = limitTimeView
            break
        default: break
        }
        
        cell.contentView.addSubview(cell.subview!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.section) {
        case 0:
            return 200
        case 1:
            return 140
        case 2:
            return 180
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var title = ""
        switch(section) {
        case 0:
            title = "热门推荐"
        case 1:
            title = "手机专享"
        case 2:
            title = "限时抢购"
        default:
            title = ""
        }
        let view = HeaderInSectionView.init(title: title, frame: CGRect.init(x: 0, y: 0, width: width, height: 20))
        return view
    }
    
}
