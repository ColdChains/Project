//
//  MainViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/26.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate, MainViewControllerProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - IBAction Function
    
    var imagePicker = UIImagePickerController.init()
    
    @IBOutlet var searchBar: [UISearchBar]!
    
    @IBAction func cityAction(_ sender: UIButton) {
        let vc = CityListTableViewController()
        self.show(vc, sender: sender)
    }
    
    @IBAction func scanAction(_ sender: UIButton) {
        print(123)
        
        imagePicker.delegate = self
        imagePicker.modalTransitionStyle = .flipHorizontal
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func phoneAction(_ sender: UIBarButtonItem) {
        print(123)
    }
    
    @IBAction func messageAction(_ sender: UIBarButtonItem) {
        self.modalTransitionStyle = .partialCurl
        let vc = LoginViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let vc = SearchTableViewController()
        self.show(vc, sender: nil)
        return false
    }
    
    // MARK: - General Foundtion
    
    var topView: UIButton!
    var tableView: MainTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        
        tableView = MainTableView.init(delegate: self, frame: self.view.bounds, urlInfo: nil)
        self.view.addSubview(tableView)
        
        searchBar[0].delegate = self
        createView()
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.test), userInfo: nil, repeats: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.refreshData()
    }
    
    func test() {
        self.view.addSubview(UILabel.defaultAlertLabelAtDown(message: "亲，您还未登录"))
        
    }
    
    
    func createView() {
        topView = UIButton.init(frame: CGRect.init(x: self.view.bounds.width - 60, y: self.view.bounds.height - 120, width: 40, height: 40))
        topView.backgroundColor = UIColor.red
        topView.setTitleColor(UIColor.white, for: .normal)
        topView.setTitle("Top", for: .normal)
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        topView.isHidden = true
        topView.addTarget(self, action: #selector(self.topAction(sender:)), for: .touchUpInside)
        self.view.addSubview(topView)
    }
    
    func topAction(sender: UIButton) {
        tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    }
    
    //点击显示详情
    func showView() {
        let vc = BaseViewController()
        self.show(vc, sender: nil)
    }
    
    // MARK: - MainTableView Protocol Funcdtion
    
    //横向轮播图
    func didselectAutoPlayView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, name: String) {
        print("横向轮播图", indexPath.item)
        if indexPath.item == 0 {
            let vc = BaseViewController()
            self.show(vc, sender: nil)
            return
        }
        
        let vc = AutoPlayDetailViewController.init(index: indexPath.item - 1, title: name)
        self.show(vc, sender: nil)
    }
    
    //纵向轮播图
    func didselectAutoPlayViewVertical(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String) {
        print("纵向轮播图", indexPath.item)
        let vc = BaseViewController()
        self.show(vc, sender: nil)
    }
    
    /*//表头集合视图
     func didselectHeaderCollectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String) {
     print("表头集合视图", indexPath.item)
     showView()
     }*/
    
    func didselectHeaderCollectionViewOne(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String) {
        print("菜单一", indexPath.item)
        let vc = ScenicSpotTableViewController()
        self.show(vc, sender: nil)
    }
    
    func didselectHeaderCollectionViewTwo(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: String) {
        print("菜单二", indexPath.item)
        let vc = ScenicSpotTableViewController()
        self.show(vc, sender: nil)
    }
    
    //热门推荐
    func didselectHotRecommondView(didSelectItemAt indexPath: Int, model: AttractionModel) {
        print("热门推荐", indexPath)
        let vc = BaseViewController()
        self.show(vc, sender: nil)
    }
    
    //手机专享
    func didselectPhoneEnjoyView(didSelectItemAt indexPath: Int, model: String) {
        print("手机专享", indexPath)
        let vc = BaseViewController()
        self.show(vc, sender: nil)
    }
    
    //限时抢购
    func didselectLimitTimeCollectionView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, model: LimitTimeModel) {
        print("限时抢购", indexPath.item)
        let vc = LimitTimeTableViewController()
        vc.model = model
        self.show(vc, sender: nil)
    }
    
    //表格视图
    func didselectMainTableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath, model: AttractionModel) {
        print("表格视图", indexPath.row)
        let vc = AttractionDetailViewController()
        vc.model = model
        self.show(vc, sender: nil)
    }
    
    func scrollViewDidScrollMainTableView(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 1111 {
            topView.isHidden = false
        }
        else {
            topView.isHidden = true
        }
    }
    
    //  MARK: - Other Protocol Function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage]
        UIImageWriteToSavedPhotosAlbum(image as! UIImage, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
