//
//  SoundViewController.swift
//  SleepBee
//
//  Created by Jasmine Lee on 11/19/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit

class SoundViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var myTableView : UITableView!
    var user = UserInfo.sharedInstance;
    var selectIndex : NSInteger!
    
    let sunds = ["Radar","Gentle","Pan fiute","Ocean Waves","Bird Calls","Bacon pancakes","Custom"];
    let sundsUrl = ["http://mobiringtones.net/uploads/ringtones/1679499-Radar.mp3","http://mobiringtones.net/uploads/ringtones/1913624-7gentle-alarm.mp3","http://mobiringtones.net/uploads/ringtones/1913654-A-Field-in-Spring.mp3","http://mobiringtones.net/uploads/ringtones/1912439-Bacon-Pancakes.mp3","http://mobiringtones.net/uploads/ringtones/1912439-Bacon-Pancakes.mp3","http://mobiringtones.net/uploads/ringtones/1910960-rudzik.mp3","http://mobiringtones.net/uploads/ringtones/1910960-rudzik.mp3"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sound";
        selectIndex = user.defultIndex;
        user.defultUrl = sundsUrl[selectIndex];
        user.defultSound = sunds[selectIndex];
        myTableView = UITableView();
        self.view.addSubview(myTableView);
        myTableView.tableFooterView = UIView();
        myTableView.dataSource = self;
        myTableView.delegate = self;
        myTableView.frame = CGM(0, y: 0, w: CONTENTX, h: CONTENTY);
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid");
        

    }
    
//    func playSound(trackURL: String) {
//        let url = URL(string: trackURL)
//        let item:AVPlayerItem = AVPlayerItem(url: url!)
//        alarmAudioPlayer.replaceCurrentItem(with: item)
//        
//        alarmAudioPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(playerItemDidReachEnd),
//                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
//                                               object: alarmAudioPlayer.currentItem)
//        
//        alarmAudioPlayer!.play()
//    }
//
//
//    func playerItemDidReachEnd(notification: NSNotification) {
//        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
//            playerItem.seek(to: kCMTimeZero)
//        }
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        alarmAudioPlayer.pause()
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        ;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellid";
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId)!;
        cell.imageView?.image = UIImage.init(named: "song");
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        if indexPath.row == selectIndex {
            let str : String = (sunds[indexPath.row] as? String)!.appending("(Default)");
            cell.textLabel?.text = str;
        }else{
            cell.textLabel?.text = sunds[indexPath.row];
        }
        if indexPath.row==6 {
            cell.imageView?.image = UIImage.init(named: "");
            cell.textLabel?.textAlignment = NSTextAlignment.center;
            cell.textLabel?.textColor = UIColor.gray;
            cell.accessoryType = UITableViewCellAccessoryType.none;


        }else{
            cell.imageView?.image = UIImage.init(named: "song");
            cell.textLabel?.textAlignment = NSTextAlignment.left;
            cell.textLabel?.textColor = PYRGBA(153, g: 153, b: 153, a: 1);
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;


        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row==6 {
            return;
        }
        
        
        
        let alertController = UIAlertController(title: "Warning!", message: "set to  default music ？", preferredStyle: UIAlertControllerStyle.alert);
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default) { (UIAlertAction) in
            self.selectIndex = indexPath.row;
            self.user.defultIndex = self.selectIndex;
            self.myTableView.reloadData();
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
