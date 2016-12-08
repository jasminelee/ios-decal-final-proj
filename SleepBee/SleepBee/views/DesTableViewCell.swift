//
//  DesTableViewCell.swift
//  SleepBee
//
//  Created by 赵永生 on 2016/12/7.
//  Copyright © 2016年 Alexis Tran. All rights reserved.
//

import UIKit

class DesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var detailLa : UITextView!;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier);
        detailLa = UITextView()
        self.addSubview(detailLa);
        detailLa.isEditable = false;
        detailLa.textAlignment = NSTextAlignment.justified
        detailLa.font = UIFont.systemFont(ofSize: 15);
        detailLa.textColor = UIColor.gray;
        detailLa.frame = CGM(0, y: 0, w: CONTENTX, h: 300);
        detailLa.text = "15 mins - Ideal for a boost of energy and alertness.\n\n30 mins - can help improve mood,alertness, and performance, but may cause sleep inertia for up to 30 mins before the nap’s restorative benefits become apparent. \n\n90 mins - some grogginess, best for improvement in remembering facts, faces, and names \n\n60 mins - a full cycle of sleep, avoids sleep inertia, improved emotional and procedural memory and creativity, and easy to wake up."
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
