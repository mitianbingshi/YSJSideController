//
//  LeftViewController.swift
//  ShopNC_SaaS
//
//  Created by 闫树军 on 16/4/12.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    var mainTableView          :UITableView!
    var mainDataSource         :NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithRGBA(230, G: 47, B: 44, A: 1)
        
        mainDataSource = ["1111","2222","3333","4444","5555","6666","7777","8888","9999"]
        mainTableView = UITableView.init(frame: CGRectMake(0, 0, kScreenWidth, kScreenHeight-20), style: UITableViewStyle.Plain)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.backgroundColor = UIColor.colorWithRGBA(230, G: 47, B: 44, A: 1)
        mainTableView.tableFooterView = UIView.init()
        self.view.addSubview(mainTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDataSource
extension LeftViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifer :String! = "menuListCell"
        var cell :UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifer)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: identifer)
        }
        cell.textLabel?.text = mainDataSource.objectAtIndex(indexPath.row) as? String
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = tFont
        return cell
    }
    
    
}
// MARK: - UITableViewDelegate
extension LeftViewController : UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRectMake(0, 0, kScreenWidth, 180))
        headerView.backgroundColor = UIColor.colorWithRGBA(230, G: 47, B: 44, A: 1)
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        NSNotificationCenter.defaultCenter().postNotificationName("POSTTOCONTROLLER", object: indexPath.row)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.leftSide.closeLeftMenu()

    }
    
}

