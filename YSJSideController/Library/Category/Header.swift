//
//  Header.swift
//  ShopNC_SaaS
//
//  Created by 闫树军 on 16/4/13.
//  Copyright © 2016年 闫树军. All rights reserved.
//

import UIKit

let iOS9Later              = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 9.0
let iPhone4s               = (UIScreen.mainScreen().bounds.size.width == 320)
let iPhone4sLater          = (UIScreen.mainScreen().bounds.size.width > 320)
let kScreenWidth           = CGRectGetWidth(UIScreen.mainScreen().bounds)
let kScreenHeight          = CGRectGetHeight(UIScreen.mainScreen().bounds)
let kFont                  = UIFont.systemFontOfSize(14.0)
let tFont                  = UIFont.systemFontOfSize(16.0)

class Header: NSObject {

}
