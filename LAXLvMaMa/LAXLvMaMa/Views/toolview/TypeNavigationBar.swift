//
//  TypeNavigationBar.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/16.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

//分类导航条
extension UIView {
    class func getTypeNavigationBar() -> TypeNavigationBar {
        return TypeNavigationBar.init(titles: ["分类","分类","分类"], titleFontSize: 14, frame: CGRect.init(x: 50, y: 100, width: 300, height: 49))
    }
}

class TypeNavigationBar: UIView {
    
    var segment: UISegmentedControl!
    var location: UIView!
    var fontSize: CGFloat = 14
    
    var pageScroll: PageScrollController?
    
    init(titles: [String], titleFontSize: CGFloat, frame: CGRect) {
        
        super.init(frame: frame)
        //self.backgroundColor = UIColor.lightGray
        
        fontSize = titleFontSize
        createView(titles: titles)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView(titles: [String]) {
        
        segment = UISegmentedControl.init(items: titles)
        segment.frame = CGRect.init(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        segment.selectedSegmentIndex = 0
        segment.tintColor = UIColor.clear
        setSegmentFont(size: fontSize)
        
        segment.addTarget(self, action: #selector(self.segmentAction), for: .valueChanged)
        self.addSubview(segment)
        
        let w = bounds.size.width / CGFloat(titles.count)
        let h = bounds.size.height - 2
        let offset = (w - getStringWidth(index: 0)) / 2
        
        location = UIView.init(frame: CGRect.init(x: offset, y: h, width: getStringWidth(index: 0), height: 2))
        location.backgroundColor = UIColor.red
        self.addSubview(location)
        
    }
    
    func segmentAction() {
        setLocation()
        pageScroll?.setSelectedViewController(selectedIndex: segment.selectedSegmentIndex)
    }
    
    //设置分段控件下标
    func setSegment(selectedindex: Int) {
        segment.selectedSegmentIndex = selectedindex
        setLocation()
    }
    
    //设置当前位置视图
    func setLocation() {
        let w = bounds.size.width / CGFloat(segment.numberOfSegments)
        var frame = location.frame
        frame.origin.x = CGFloat(segment.selectedSegmentIndex) * w + (w - getStringWidth(index: segment.selectedSegmentIndex)) / 2
        location.frame = frame
    }
    
    //设置分段控件文字字体
    func setSegmentFont(size: CGFloat) {
        segment.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange, NSFontAttributeName: UIFont.systemFont(ofSize: size)], for: .normal)
        segment.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: UIFont.systemFont(ofSize: size)], for: .selected)
    }
    
    //获取字符串占用的宽度
    func getStringWidth(index: Int) -> CGFloat {
        return (segment.titleForSegment(at: index)! as NSString).boundingRect(with: CGSize.init(width: 100, height: 100), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], context: nil).size.width
    }
    
}
