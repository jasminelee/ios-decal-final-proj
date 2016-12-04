//
//  SoundViewController.swift
//  SleepBee
//
//  Created by Jasmine Lee on 11/19/16.
//  Copyright © 2016 Jasmine Lee. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

var userSelection: String = "http://mobiringtones.net/uploads/ringtones/1679499-Radar.mp3" // default
var alarmAudioPlayer: AVQueuePlayer!

class SoundViewController: UIViewController {

    var paused = true

    @IBAction func Radar(_ sender: UIButton) { // deselect to pause
        if paused {
            let radar = "http://mobiringtones.net/uploads/ringtones/1679499-Radar.mp3"
            userSelection = radar
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }

    @IBAction func Gentle(_ sender: UIButton) {
        if paused {
            let gentle = "http://mobiringtones.net/uploads/ringtones/1913624-7gentle-alarm.mp3"
            userSelection = gentle
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func panFlute(_ sender: UIButton) {
        if paused {
            let panFlute = "http://mobiringtones.net/uploads/ringtones/1913654-A-Field-in-Spring.mp3"
            userSelection = panFlute
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func baconPancakes(_ sender: UIButton) {
        if paused {
            let baconPancakes = "http://mobiringtones.net/uploads/ringtones/1912439-Bacon-Pancakes.mp3"
            userSelection = baconPancakes
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }

    @IBAction func oceanWaves(_ sender: UIButton) {
        if paused {
            let oceanWaves = "http://mobilering.net/ringtones/mp3/sound-effects/ocean-waves.mp3"
            userSelection = oceanWaves
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func birdCalls(_ sender: UIButton) {
        if paused {
            let birdCalls = "http://mobiringtones.net/uploads/ringtones/1910960-rudzik.mp3"
            userSelection = birdCalls
            playSound(trackURL: userSelection)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmAudioPlayer = AVQueuePlayer()
        // Do any additional setup after loading the view.
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
    
    override func viewWillDisappear(_ animated: Bool) {
        alarmAudioPlayer.pause()
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
