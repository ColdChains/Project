//
//  MyselfTableViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/16.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//我的页面
class MyselfTableViewController: UITableViewController, MyselfViewControllerProtocol {
    
    var zoomImageView: UIImageView!
    
    var headImageView: UIImageView!
    
    var nickNameLabel: UILabel!
    
    var imageHeight: CGFloat = 180
    
    var dataArr: [[String]] = [[""], [""], ["常用信息", "我的收藏", "我的游记", "离线游记", "历史浏览"], ["设置", "关于驴爸爸", "参与有奖问卷", "客服中心", "关于驴爸爸微信"]]
    var nameArr: [[String]] = [[""], [""], ["changyongxinxi", "wodeshoucang", "wodeyouji", "lixianyouji", "lishiliulan"], ["myLVMMIcon40", "myLVMMIcon41", "mylvmmWenjuan", "myLVMMIcon42", "mylvmmWeixin"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = "我的"
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0);
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        createView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func createView() {
        
        zoomImageView = UIImageView.init(image: UIImage.init(named: "dingbubeijing"))
        zoomImageView.frame = CGRect.init(x: 0, y: 0 - imageHeight, width: self.view.frame.width, height: imageHeight)
        zoomImageView.contentMode = .scaleAspectFill //高度改变宽度也跟着改变（不设置那将只会被纵向拉伸）
        self.view.addSubview(zoomImageView)
        
        headImageView = UIImageView.init(frame: CGRect.init(x: 10, y: imageHeight - 60, width: 40, height: 40))
        headImageView.image = UIImage.init(named: "a")
        headImageView.layer.cornerRadius = 20
        headImageView.clipsToBounds = true
        zoomImageView.addSubview(headImageView)
        
        nickNameLabel = UILabel.init(frame: CGRect.init(x: 60, y: imageHeight - 50, width: 300, height: 30))
        nickNameLabel.text = "未登录"
        nickNameLabel.textColor = UIColor.white
        zoomImageView.addSubview(nickNameLabel)
        
        zoomImageView.autoresizesSubviews = true
        headImageView.autoresizingMask = .flexibleTopMargin
        nickNameLabel.autoresizingMask = .flexibleTopMargin
        
        zoomImageView.isUserInteractionEnabled = true
        headImageView.isUserInteractionEnabled = true
        nickNameLabel.isUserInteractionEnabled = true
        
        headImageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.touchHeadImageView)))
        nickNameLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.touchNicknameLabel)))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = "全部订单"
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let view = MyselfCollectionView.init(line: 1, rank: 4, frame: cell.bounds)
            view.viewdelegate = self
            cell.contentView.addSubview(view)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = UIEdgeInsets.zero
        cell.clipsToBounds = true
        
        cell.imageView?.image = UIImage.init(named: nameArr[indexPath.section][indexPath.row])
        cell.textLabel?.text = dataArr[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
        
        if indexPath.section == 2 && indexPath.row == 1 {
            
            let vc = CollectTableViewController()
            vc.dataArr = LAXDataBaseOperation.selectAllAttractionEntity()
            self.show(vc, sender: nil)
            
        } else {
            
            showLoginViewController()
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 100
        }
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        return view
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        return view
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y;
        if y < 0 - imageHeight && zoomImageView != nil {
            var frame = zoomImageView.frame
            frame.origin.y = y;
            frame.size.height =  0 - y
            zoomImageView.frame = frame
        }
    }
    
    //点击菜单
    func didselectMyselfCollectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String) {
        print(model)
        
        showLoginViewController()
    }
    
    //点击头像
    func touchHeadImageView() {
        print("头像")
        showLoginViewController()
    }
    
    //点击昵称
    func touchNicknameLabel() {
        print("昵称")
        showLoginViewController()
    }
    
    func showLoginViewController() {
        self.modalTransitionStyle = .partialCurl
        let vc = LoginViewController()
        self.present(vc, animated: true, completion: nil)
    }
   
}
