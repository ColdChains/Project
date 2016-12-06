//
//  DestinationViewControllerProtocol.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/18.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import Foundation
import UIKit

protocol DestinationViewControllerProtocol {
    func didselectDestinationTableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath, model: DestinationModel)
}
