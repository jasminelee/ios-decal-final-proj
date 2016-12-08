//
//  Confing.swift
//  SleepBee
//
//  Created by Alexis on 2016/12/7.
//  Copyright © 2016年 Alexis Tran. All rights reserved.
//

import UIKit

let CONTENTX = UIScreen.main.bounds.width;
let CONTENTY = UIScreen.main.bounds.height;


func PYRGBA(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    return  UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func CGM(_ x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat)->CGRect{
    return CGRect(x:x,y:y,width:w,height:h);
}
