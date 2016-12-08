//
//  UserInfo.swift
//  ZShine
//
//  Created by Tianyi Sun on 2016/10/18.
//  Copyright © 2016年 Tianyi Sun. All rights reserved.
//

import Foundation
class UserInfo : NSObject{
   internal static let sharedInstance = UserInfo()
    var defultUrl : String?
    var defultSound : String?
    var defultIndex : NSInteger?;
    fileprivate override init(){
        defultUrl = "http://mobiringtones.net/uploads/ringtones/1679499-Radar.mp3"
        defultSound = "Radar"
        defultIndex = 0;
    }
}
