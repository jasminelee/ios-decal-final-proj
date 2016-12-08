//
//  CustomTimeTableViewCell.swift
//  SleepBee
//
//  Created by 赵永生 on 2016/12/7.
//  Copyright © 2016年 Alexis Tran. All rights reserved.
//

import UIKit

class CustomTimeTableViewCell: UITableViewCell {
    var addbutton:UIButton!;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        addbutton = UIButton.init(type: UIButtonType.custom);
        self.addSubview(addbutton);
        addbutton.setImage(UIImage.init(named: "addTime"), for: UIControlState.normal);
        addbutton.frame = CGM(CONTENTX-60, y: 30, w: 40, h: 40);
        addbutton.isHidden = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
