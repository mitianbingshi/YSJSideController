//
//  MainViewController.swift
//  ShopNC_SaaS
//
//  Created by 闫树军 on 16/4/12.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // 跳转通知
        // 跳转通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.pushToController(_:)), name: "POSTTOCONTROLLER", object: nil)
        
        let leftItem=UIBarButtonItem(title: "菜单", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MainViewController.menu))
        self.navigationItem.leftBarButtonItem=leftItem
        
        
        let rightItem=UIBarButtonItem(title: "分享", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MainViewController.share))
        self.navigationItem.rightBarButtonItem=rightItem
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - 菜单
    func menu() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.leftSide .showLeftMenu()
    }
    
    // MARK: - 分享
    func share() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.leftSide .closeLeftMenu()
    }
    
    // MARK: - 通知跳转
    func pushToController(notification:NSNotification) {
        self.navigationController?.pushViewController(TempViewController(), animated: true)
    }
   
    
    // MARK: - 内存警告
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
