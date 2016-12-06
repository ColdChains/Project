//
//  LoginViewController.swift
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/11/1.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var transTime = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginStyleSegment: UISegmentedControl!
    @IBAction func reutrnAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func forgetPwdAction(_ sender: AnyObject) {
        self.modalTransitionStyle = .coverVertical
        let vc = ChangeViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registerAction(_ sender: AnyObject) {
        self.modalTransitionStyle = .crossDissolve
        let vc = RegisterViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func agreeProtocolAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func switchStyleAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            UIView.animate(withDuration: transTime, animations: {
                self.loginConstraint.constant += self.view.frame.width
                self.view.layoutIfNeeded()
            })
            
        } else {
            
            UIView.animate(withDuration: transTime, animations: {
                self.loginConstraint.constant -= self.view.frame.width
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    @IBAction func leftGestureAction(_ sender: UISwipeGestureRecognizer) {
        
        if self.loginConstraint.constant >= 0 && self.loginConstraint.constant <= self.view.frame.width {
            UIView.animate(withDuration: transTime, animations: {
                
                self.loginConstraint.constant -= self.view.frame.width
                self.view.layoutIfNeeded()
                
                }, completion: { (b) in
                    if b {
                        self.loginStyleSegment.selectedSegmentIndex = 1
                    }
            })
        }
        
    }
    
    @IBAction func rightGestureAction(_ sender: UISwipeGestureRecognizer) {
        
        if self.loginConstraint.constant <= 0 && self.loginConstraint.constant >= 0 - self.view.frame.width {
            UIView.animate(withDuration: transTime, animations: {
                
                self.loginConstraint.constant += self.view.frame.width
                self.view.layoutIfNeeded()
                
                }, completion: { (b) in
                    if b {
                        self.loginStyleSegment.selectedSegmentIndex = 0
                    }
            })
            
        }
        
    }

}
