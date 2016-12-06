//
//  AppDelegate.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/20.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var reach: Reachability?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        addNotification()
        LAXDataBaseOperation.bindModelWithDataBase()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //  MARK: - Custom Function
    
    func addNotification() {
        
        //创建对象
        reach = Reachability.forInternetConnection()
        //告诉Reachability对象，我们不想通过3G/4G/GPRS连接网络
        reach?.reachableOnWWAN = false
        //通过通知中心监听网络状态的改变
        NotificationCenter.default.addObserver(self , selector: #selector(self.statusChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        //启动监听
        reach?.startNotifier()
        
    }
    
    func statusChanged() {
        
        //Wifi 无线网
        //WWAN 2G/3G/4G/GPRS
        if reach!.isReachableViaWiFi() || reach!.isReachableViaWWAN() {
            print("网络已连接")
            if reach!.isReachableViaWWAN() {
                self.showRightWithTitle(title: "3G/4G网络已连接", autoCloseTime: 1.5)
                print("走得流量，得花好多钱")
            } else {
                self.showRightWithTitle(title: "WIFI网络已连接", autoCloseTime: 1.5)
                print("WiFi流量，电影随便看")
            }
        }
        else if reach!.isReachable() == false {
            self.showErrorWithTitle(title: "网络已断开", autoCloseTime: 2)
            print("网络已断开")
        }
        
    }
    

}

