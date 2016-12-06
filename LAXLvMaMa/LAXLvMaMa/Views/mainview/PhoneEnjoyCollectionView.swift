//
//  PhoneEnjoyCollectionView.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/19.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

extension UIView {
    func getPhoneEnjoyCollectionView() -> PhoneEnjoyCollectionView {
        return PhoneEnjoyCollectionView.init(CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 140))
    }
}

class PhoneEnjoyCollectionView: BaseHeaderCollectionView {
    
    var phoneArr: [String] = []
    //var dataArr = [AttractionModel]()
    
    init(_ frame: CGRect) {
        super.init(line: 2, rank: 2, space: 2, frame: frame)
        self.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        requestData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func requestData() {
        LAXAlamofire.requestPhoneEnjoy(str: URL_STR_MAIN_HOTANDPHONE, success: { (arr) in
            
                self.dataArr = []
                for model in arr {
                    self.dataArr.append(model.large_image!)
                }
                self.reloadData()
            
            }) { (err) in
                print(err)
                _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.requestData), userInfo: nil, repeats: false)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HeaderCollectionViewCell
        cell.imgView.af_setImage(withURL: URL.init(string: self.dataArr[indexPath.row])!, placeholderImage: UIImage.init(named: "a"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print(indexPath.item)
        self.viewdelegate?.didselectPhoneEnjoyView(didSelectItemAt: indexPath.item, model: dataArr[indexPath.item])
        //didselectHeaderCollectionView(collectionView: collectionView, didSelectItemAt: indexPath, model: dataArr[indexPath.item])
        
    }
    
}
