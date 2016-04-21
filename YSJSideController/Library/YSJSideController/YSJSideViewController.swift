//
//  YSJSideViewController.swift
//  ShopNC_SaaS
//
//  Created by 闫树军 on 16/4/12.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class YSJSideViewController: UIViewController {
    
    var isClosed                :Bool!  //是否关闭左视图
    var menuTableView           :UITableView!// 左边菜单
    var leftViewController      :UIViewController!// 用来接收左视图
    var mainViewController      :UIViewController!//用来接收主视图
    var _scalef                 :CGFloat!
    var _leftLength             :CGFloat!
    var tap                     :UITapGestureRecognizer!
    var pan                     :UIPanGestureRecognizer!
   
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        isClosed = true
    }
    
    // MARK: - 重写init方法   但是swift不支持自定义 init方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
        let navigation = UINavigationController.init(rootViewController: MainViewController())
        navigation.navigationBar.barTintColor = UIColor.colorWithRGBA(230, G: 47, B: 44, A: 1)
        navigation.navigationBar.translucent = false
        
        if iPhone4s {
            _leftLength = 200
        }else{
            _leftLength = 280
        }
        create(LeftViewController(), mainVC: navigation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: - 创建leftViewController和 mainViewController
    func create( leftVC : UIViewController, mainVC : UIViewController){
        
        self.leftViewController = leftVC
        self.mainViewController = mainVC
        
        
        for view in leftVC.view.subviews {
            if view.isKindOfClass(UITableView){
                menuTableView = view as!UITableView
            }
        }
        
        // 点击主界面 关闭菜单
        tap = UITapGestureRecognizer(target: self, action: #selector(YSJSideViewController.handleTapGesture(_:)))
        pan = UIPanGestureRecognizer(target:self ,action:#selector(YSJSideViewController.handlePanGesture(_:)))
        // 点击主界面 关闭菜单
        self.mainViewController.view.addGestureRecognizer(tap)
        self.mainViewController.view.addGestureRecognizer(pan)

        self.view.addSubview(self.leftViewController.view)
        self.view.addSubview(self.mainViewController.view)
    }
    
    
    // MARK:- 显示左侧菜单
    func showLeftMenu(){
        UIView.beginAnimations(nil, context: nil)
        self.mainViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        self.mainViewController.view.center = CGPointMake((UIScreen.mainScreen().bounds.size.width+400)/2,20 + UIScreen.mainScreen().bounds.size.height/2)
        UIView.commitAnimations()
        
        self.mainViewController.view.addGestureRecognizer(pan)
        self.mainViewController.view.addGestureRecognizer(tap)

        
    }
    
    // MARK: - 关闭左侧菜单
    func closeLeftMenu(){
        UIView.beginAnimations(nil, context: nil)
        self.mainViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        self.mainViewController.view.center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2,20 + UIScreen.mainScreen().bounds.size.height/2)
        UIView.commitAnimations()
        
        self.mainViewController.view.removeGestureRecognizer(pan)
        self.mainViewController.view.removeGestureRecognizer(tap)
    }
    
    // MARK: - 点击主界面 关闭菜单
     func handleTapGesture(tap:UITapGestureRecognizer){
        closeLeftMenu()
    }
    
    // MARK: - 滑动关闭
    func handlePanGesture(tan:UIPanGestureRecognizer){
        let point :CGPoint = tan.translationInView(self.view)
        var changeX : CGFloat! = (tan.view?.center.x)! + point.x * 1

            
            if changeX <= UIScreen.mainScreen().bounds.size.width/2 - 1 {
                changeX = UIScreen.mainScreen().bounds.size.width/2
            }
            
            if changeX >= (UIScreen.mainScreen().bounds.size.width + 400)/2 {
                changeX = (UIScreen.mainScreen().bounds.size.width + 400)/2
            }
            
            print(UIScreen.mainScreen().bounds.size.width , changeX)
            tan.view?.center = CGPointMake(changeX, (tan.view?.center.y)!)
            tan.view?.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
            tan .setTranslation(CGPointMake(0, 0), inView: self.view)
        
        
        
        //******************** 当手势在一半停止时****************************
        if tan.state == UIGestureRecognizerState.Ended {
            
            if changeX > ((UIScreen.mainScreen().bounds.size.width)/2+100) {
                
                print(changeX,"------",((UIScreen.mainScreen().bounds.size.width)/2+100))
                
                showLeftMenu()
                
            }else{
            
                closeLeftMenu()
            }
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




