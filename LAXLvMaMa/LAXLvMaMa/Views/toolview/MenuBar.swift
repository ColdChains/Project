//
//  MenuBar.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/26.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation

protocol MenuBarDelegate {
    func didSelectedMenuBar(sender: UISegmentedControl, selectedIndex: Int)
}

class MenuBar: UIView {
    
    var fontSize: CGFloat = 17
    var titleWidth: CGFloat = 320
    var segment: UISegmentedControl!
    var location: UIView!
    
    var viewDelegate: MenuBarDelegate?
    
    init(titles: [String], titleFontSize: CGFloat, titleWidth: CGFloat, frame: CGRect) {
        
        super.init(frame: frame)
        //self.backgroundColor = UIColor.lightGray
        self.fontSize = titleFontSize
        self.titleWidth = titleWidth
        createView(titles: titles)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView(titles: [String]) {
        
        segment = UISegmentedControl.init(items: titles)
        segment.frame = CGRect.init(x: 0, y: 0, width: titleWidth, height: bounds.height)
        
        segment.selectedSegmentIndex = 0
        segment.tintColor = UIColor.clear
        setSegmentFont(size: fontSize)
        
        segment.addTarget(self, action: #selector(self.segmentAction(sender:)), for: .valueChanged)
        self.addSubview(segment)
        
        let w = titleWidth / CGFloat(titles.count)
        let h = bounds.size.height - 2
        let offset = (w - getStringWidth(index: 0)) / 2
        
        location = UIView.init(frame: CGRect.init(x: offset, y: h, width: getStringWidth(index: 0), height: 2))
        location.backgroundColor = UIColor.red
        self.addSubview(location)
        
    }
    
    func segmentAction(sender: UISegmentedControl) {
        setLocation(index: sender.selectedSegmentIndex)
        viewDelegate?.didSelectedMenuBar(sender: sender, selectedIndex: segment.selectedSegmentIndex)
    }
    
    func setSegmentTitle(titles: [String]) {
        for i in 0..<segment.numberOfSegments {
            segment.setTitle(titles[i], forSegmentAt: i)
        }
        setSegmentIndex(selectedindex: 0)
        setLocation(index: 0)
    }
    
    //设置分段控件下标
    func setSegmentIndex(selectedindex: Int) {
        segment.selectedSegmentIndex = selectedindex
        setLocation(index: selectedindex)
    }
    
    //设置当前位置视图
    func setLocation(index: Int) {
        let w = titleWidth / CGFloat(segment.numberOfSegments)
        var frame = location.frame
        frame.origin.x = CGFloat(segment.selectedSegmentIndex) * w + (w - getStringWidth(index: segment.selectedSegmentIndex)) / 2
        frame.size.width = getStringWidth(index: index)
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
