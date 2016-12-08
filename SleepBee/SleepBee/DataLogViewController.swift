//
//  SecondViewController.swift
//  SleepBee
//
//  Created by Tianyi Sun on 11/19/16.
//  Copyright © 2016 Tianyi Sun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var myTableView : UITableView!
    let minshead = ["15mins","30mins","60mins","90mins"];
    let minsDes = ["Ideal for a boost of energy and alertness","can help improve mood,alertness, and performance, but may cause sleep inertia for up to 30 mins before the nap’s restorative benefits become apparent","some grogginess, best for improvement in remembering facts, faces, and names","a full cycle of sleep, avoids sleep inertia, improved emotional and procedural memory and creativity, and easy to wake up"];
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sleepArray);
        print(sleependTimeArray);
        self.view.backgroundColor = UIColor.white;
        myTableView = UITableView();
        self.view.addSubview(myTableView);
        myTableView.tableFooterView = UIView();
        myTableView.dataSource = self;
        myTableView.delegate = self;
        myTableView.frame = CGM(0, y: 64, w: CONTENTX, h: CONTENTY);
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid");
        myTableView.register(DesTableViewCell.self, forCellReuseIdentifier: "cellidtwo");
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        let titleLa = UILabel();
        self.view.addSubview(titleLa);
        titleLa.backgroundColor = UIColor.white;
        titleLa.text = "Info";
        titleLa.frame = CGM(0, y: 20, w: CONTENTX, h: 44);
        titleLa.font = UIFont.boldSystemFont(ofSize: 18);
        titleLa.textAlignment = NSTextAlignment.center;
        
        let lineView = UIView();
        self.view.addSubview(lineView);
        lineView.backgroundColor = PYRGBA(227, g: 227, b: 229, a: 1);
        lineView.frame = CGM(0, y: 63.5, w: CONTENTX, h: 0.5);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==1 {
            return 1;
        }else{
            return sleependTimeArray.count;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==1 {
            return 300;
        }else{
            return 60;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellid";
        let cellIdtwo = "cellidtwo";
        if indexPath.section==1{
            let cell : DesTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdtwo)! as! DesTableViewCell;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;

        }else{
            let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId)!;
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            cell.imageView?.image = UIImage.init(named: "recod");
            cell.textLabel?.textColor = PYRGBA(34, g: 34, b: 34, a: 1);
            let bottomview = UIView();
            cell.textLabel?.numberOfLines = 0;
            let str1 = sleepArray[indexPath.row];
            let str2 = sleependTimeArray[indexPath.row];
            let str = String.init(format: "have sleep %@ mins on %@", str1 as! CVarArg,str2 as! CVarArg)
            cell.textLabel?.text = str;
            cell.contentView.addSubview(bottomview);
            bottomview.backgroundColor = PYRGBA(227, g: 229, b: 229, a: 1);
            bottomview.frame = CGM(0, y: 59.5, w: CONTENTX, h: 0.5);
            return cell;

        }
    }

}

