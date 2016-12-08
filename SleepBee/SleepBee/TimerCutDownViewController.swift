//
//  TimerCutDownViewController.swift
//  SleepBee
//
//  Created by Tianyi Sun on 2016/12/7.
//  Copyright © 2016年 Alexis Tran. All rights reserved.
//

import UIKit
import AVFoundation

class TimerCutDownViewController: UIViewController,AVAudioPlayerDelegate {
    var cutDownTime : NSInteger!
    var curentTime = 0;
    var timeShowLa : UILabel!;
    var startStopButton : UIButton!
    var restartButton : UIButton!
    var timer : Timer!
    var isTiming = true;
    var user = UserInfo.sharedInstance;
     var audioPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Timer";
        curentTime = cutDownTime;
        self.view.backgroundColor = UIColor.white;
        timeShowLa = UILabel();
        self.view.addSubview(timeShowLa);
        timeShowLa.text = self.getShowStrByTime(time: self.cutDownTime);
        timeShowLa.frame = CGM(0, y: 64, w: CONTENTX, h: 130);
        timeShowLa.textAlignment = NSTextAlignment.center;
        timeShowLa.font = UIFont.systemFont(ofSize: 40);
        timeShowLa.numberOfLines = 0;
        timeShowLa.textColor = PYRGBA(72, g: 72, b: 72, a: 1);
        
        startStopButton = UIButton.init(type: UIButtonType.custom);
        self.view.addSubview(startStopButton);
        startStopButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 85);
        startStopButton.frame = CGM((CONTENTX-120)/2, y: 200, w: 120, h: 40);
        startStopButton.setImage(UIImage.init(named: "stop"), for: UIControlState.normal);
        startStopButton.setTitle("Stop", for: UIControlState.normal);
        startStopButton.layer.cornerRadius = 4;
        startStopButton.layer.masksToBounds = true;
        startStopButton.layer.borderWidth = 0.5;
        startStopButton.layer.borderColor = PYRGBA(153, g: 153, b: 153, a: 1).cgColor;
        startStopButton.addTarget(self, action: #selector(startOrStop), for: UIControlEvents.touchUpInside)
        startStopButton.backgroundColor = UIColor.white;
        startStopButton.setTitleColor(PYRGBA(153, g: 153, b: 153, a: 1), for: UIControlState.normal);
        
        restartButton = UIButton.init(type: UIButtonType.custom);
        self.view.addSubview(restartButton);
        restartButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 85);
        restartButton.frame = CGM((CONTENTX-120)/2, y: 260, w: 120, h: 40);
        restartButton.setImage(UIImage.init(named: "restart"), for: UIControlState.normal);
        restartButton.addTarget(self, action: #selector(restartPressed), for: UIControlEvents.touchUpInside)
        restartButton.setTitle("Restart", for: UIControlState.normal);
        restartButton.layer.cornerRadius = 4;
        restartButton.layer.masksToBounds = true;
        restartButton.layer.borderWidth = 0.5;
        restartButton.layer.borderColor = PYRGBA(153, g: 153, b: 153, a: 1).cgColor;
        restartButton.backgroundColor = UIColor.white;
        restartButton.setTitleColor(PYRGBA(153, g: 153, b: 153, a: 1), for: UIControlState.normal);
        timer = Timer.init(timeInterval: 1.0, target: self, selector:#selector(timerRun), userInfo: nil, repeats: true);
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes);
        timer.fire();
    }
    func startOrStop() {
        if isTiming{
            isTiming = false;
            timer.fireDate = Date.distantFuture;
            startStopButton.setImage(UIImage.init(named: "start"), for: UIControlState.normal);
            startStopButton.setTitle("Start", for: UIControlState.normal);
        }else{
            isTiming = true;
            timer.fireDate = Date.distantPast;
            
            startStopButton.setImage(UIImage.init(named: "stop"), for: UIControlState.normal);
            startStopButton.setTitle("Stop", for: UIControlState.normal);
        }
    }
    
    func restartPressed() {
        if (audioPlayer != nil){
            if audioPlayer.isPlaying{
                audioPlayer.stop();
                
            }
        }

        isTiming = true;
        curentTime = cutDownTime;
        timer.fireDate = Date.distantPast;
        startStopButton.setImage(UIImage.init(named: "stop"), for: UIControlState.normal);
        startStopButton.setTitle("Stop", for: UIControlState.normal);
    }
    
    func timerRun(){
        curentTime -= 1;
        timeShowLa.text = self.getShowStrByTime(time: self.curentTime);
        if curentTime == 0 {
            sleepArray.add(String(cutDownTime/60));
            sleependTimeArray.add(self.stringToTimeStamp());
            timer.fireDate = Date.distantFuture;
            timeShowLa.text = "Bzz bzz! Time to wake up!"
            let resource = user.defultSound;
           let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: resource, ofType: "mp3")!)
            do {
                if (audioPlayer != nil ){
                    audioPlayer = nil;
                }
                let sound = try AVAudioPlayer(contentsOf: url)
                audioPlayer = sound
                sound.numberOfLoops = 100000;
                sound.play()
            } catch {
                // couldn't load file :(
            }
            
        }
        
    }
     func stringToTimeStamp()->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy-MM-dd"
       let str = dfmatter.string(from: NSDate() as Date)
        return String(str)
        
    }
    func getShowStrByTime(time : NSInteger) -> String {
        let hours = time/3600;
        let mins = (time-hours*3600)/60;
        let sed = time%60;
        return String(format:"%02i:%02i:%02i",hours,mins,sed);
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        timer.invalidate();
        if (audioPlayer != nil){
            if audioPlayer.isPlaying{
                audioPlayer.stop();
                
            }
        }
        
        timer = nil;
    }

}
