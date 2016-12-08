//
//  FirstViewController.swift
//  SleepBee
//
//  Created by Alexis Tran on 11/19/16.
//  Copyright © 2016 Alexis Tran. All rights reserved.
//

import UIKit
var sleepArray : NSMutableArray = NSMutableArray();
var sleependTimeArray:NSMutableArray = NSMutableArray();
class ChooseNapDurationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var myTableView : UITableView!;
    var customTimesArray : NSMutableArray = NSMutableArray();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alarm";
        customTimesArray.add("1");
        customTimesArray.add("15");
        customTimesArray.add("30");
        customTimesArray.add("60");
        customTimesArray.add("90");
        sleependTimeArray.add("2016-11-10");
        sleependTimeArray.add("2016-11-11");
        sleepArray.add("60");
        sleepArray.add("90");
        
        myTableView = UITableView();
        self.view.addSubview(myTableView);
        myTableView.dataSource = self;
        myTableView.delegate = self;
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "timenumbercellid");
        myTableView.register(CustomTimeTableViewCell.self, forCellReuseIdentifier: "timecustomcellid");
        myTableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-44);
        myTableView.tableFooterView = UIView();
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.none;

    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return customTimesArray.count;
        }
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return 60;
        }
        return 100;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0 {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "timenumbercellid")! ;
            let str : String = (customTimesArray[indexPath.row] as? String)!.appending(" mins");
            cell.textLabel?.text = str;
            cell.imageView?.image = UIImage.init(named: "times");
            cell.textLabel?.textColor = PYRGBA(153, g: 153, b: 153, a: 1);
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            let bottomview = UIView();
            cell.contentView.addSubview(bottomview);
            bottomview.backgroundColor = PYRGBA(227, g: 229, b: 229, a: 1);
            bottomview.frame = CGM(0, y: 59.5, w: CONTENTX, h: 0.5);
            return cell;
        }else{
            let cell:CustomTimeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "timecustomcellid")! as! CustomTimeTableViewCell ;
            cell.textLabel?.text = "CUSTOMIZE!";
            cell.textLabel?.textAlignment = NSTextAlignment.center;
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18);
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0 {
            let vc = TimerCutDownViewController();
            self.hidesBottomBarWhenPushed = true;
            let cuntdown : NSString = customTimesArray[indexPath.row] as! NSString
            vc.cutDownTime = cuntdown.integerValue*60;
            self.navigationController?.pushViewController(vc, animated: true);
            self.hidesBottomBarWhenPushed = false

        }else{
            let alertController = UIAlertController(title: "Add the alarm clock", message: "unit at present only minutes", preferredStyle: UIAlertControllerStyle.alert);
            
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "enter time"
                textField.keyboardType = UIKeyboardType.numberPad;
            }
            let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { (UIAlertAction) in
                let timeLa = alertController.textFields![0]
                self.customTimesArray.add(timeLa.text!);
                self.myTableView.reloadData();
                
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

