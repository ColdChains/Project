//
//  HotAndPhoneView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/19.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

extension UIView {
    func getHotRecommendView() -> HotRecommendView {
        return HotRecommendView.init(CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 210))
    }
}

class HotRecommendView: UIView {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    //var hotImageNames: [String] = []
    var dataArr = [AttractionModel]()
    
    var imageViews: [UIImageView] = []
    var viewdelegate: MainViewControllerProtocol?
    
    init(_ frame: CGRect) {
        
        super.init(frame: frame)
        width = frame.width
        height = frame.height
        createHotView()
        requestData()
        
    }
    
    init() {
        
        let frame = CGRect.init(x: 0, y: 0, width: width, height: 210)
        super.init(frame: frame)
        height = 210
        createHotView()
        requestData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createHotView() {
        self.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        var frames = [CGRect]()
        frames.append(CGRect.init(x: 1, y: 1, width: width / 2 - 1, height: height / 3 * 2 - 2))
        frames.append(CGRect.init(x: width / 2 + 1, y: 1, width: width / 2 - 1, height: height / 3 - 1))
        frames.append(CGRect.init(x: width / 2 + 1, y: height / 3 + 1, width: width / 2 - 1, height: height / 3 - 2))
        frames.append(CGRect.init(x: 1, y: height / 3 * 2, width: width / 3 - 1, height: height / 3 - 1))
        frames.append(CGRect.init(x: width / 3 + 1, y: height / 3 * 2, width: width / 3 - 1, height: height / 3 - 1))
        frames.append(CGRect.init(x: width / 3 * 2 + 1, y: height / 3 * 2, width: width / 3 - 1, height: height / 3 - 1))
        
        for i in 0...5 {
            let view = UIImageView.init(frame: frames[i])
            view.image = UIImage.init(named: "a")
            view.isUserInteractionEnabled = true
            view.tag = 10 + i
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(tap:)))
            view.addGestureRecognizer(tap)
            
            imageViews.append(view)
            self.addSubview(view)
        }
        
    }
    
    func tapAction(tap: UITapGestureRecognizer) {
        print(123)
        //print((tap.view?.tag)! - 10)
        let index = (tap.view?.tag)! - 10
        self.viewdelegate?.didselectHotRecommondView(didSelectItemAt: index, model: dataArr[index])
    }
    
    func requestData() {
        LAXAlamofire.requestHotRecommond(str: URL_STR_MAIN_HOTANDPHONE, success: { (arr) in
            
            self.dataArr = arr
            for i in 0..<self.imageViews.count {
                self.imageViews[i].af_setImage(withURL: URL.init(string: self.dataArr[i].large_image!)!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
            }
            
        }) { (err) in
            print(err)
            _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
}
