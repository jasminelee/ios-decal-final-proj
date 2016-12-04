//
//  TimerViewController.swift
//  SleepBee
//
//  Created by Alexis Tran on 11/19/16.
//  Copyright © 2016 Alexis Tran. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func startTimer(_ sender: UIButton) {
        if !timer.isValid{ //prevent more than one timer on the thread
            isTiming = true
            timerLabel.text = timeString(time: timeCount) //change to show clock instead of message
            timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                                           target: self,
                                                           selector: #selector(timerDidEnd),
                                                           userInfo: nil,
                                                           repeats: true) //repeating timer in the second iteration
        }
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate()
        alarmAudioPlayer.pause()
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        resetTimeCount()
        timerLabel.text = timeString(time: timeCount)
        isTiming = false
        alarmAudioPlayer.pause()

    }
    
    var timer = Timer() //make a timer variable, but don't do anything yet
    let timeInterval:TimeInterval = 0.05 //smaller interval
    var timerEnd:TimeInterval = 3.0 //seconds to end the timer
    var timeCount:TimeInterval = 0.0 // counter for the timer
    var isTiming = false
    
    //MARK: - Instance Methods
    func timerDidEnd(timer:Timer){
        //timer that counts down
        timeCount = timeCount - timeInterval
        if timeCount <= 0 {  //test for target time reached.
            timerLabel.text = "Bzz bzz! Time to wake up!"
            playSound(trackURL: userSelection)
            timer.invalidate()
            isTiming = false
        } else { //update the time on the clock if not reached
            timerLabel.text = timeString(time: timeCount)
        }
    }

    func playSound(trackURL: String) {
        let url = URL(string: trackURL)
        let item:AVPlayerItem = AVPlayerItem(url: url!)
        alarmAudioPlayer.replaceCurrentItem(with: item)
       
        alarmAudioPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(playerItemDidReachEnd),
                                                         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                         object: alarmAudioPlayer.currentItem)
        
        alarmAudioPlayer!.play()
    }
  
    func playerItemDidReachEnd(notification: NSNotification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: kCMTimeZero)
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let secondsFraction = seconds - Double(Int(seconds))
        return String(format:"%02i:%02i.%01i",minutes,Int(seconds),Int(secondsFraction * 10.0))
    }
    
    func resetTimeCount(){
        timeCount = timerEnd
     }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alarmAudioPlayer = AVQueuePlayer()
        countingDown()
        print(userSelection)
    }

    func countingDown() {
        if !isTiming {
            resetTimeCount()
            timerLabel.text = timeString(time: timeCount)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
