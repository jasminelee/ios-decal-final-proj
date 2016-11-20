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

class SoundViewController: UIViewController {

    var paused = true
    var alarmAudioPlayer: AVQueuePlayer!

    @IBAction func Radar(_ sender: UIButton) { // deselect to pause
        if paused {
            let radar = "http://mobiringtones.net/uploads/ringtones/1679499-Radar.mp3"
            playSound(trackURL: radar)
        } else {
            alarmAudioPlayer.pause()
        }
        paused = !paused
        sender.isSelected = !sender.isSelected
    }

    @IBAction func Marimba(_ sender: UIButton) {
        if paused {
            let marimba = ""
            playSound(trackURL: marimba)
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
        alarmAudioPlayer!.play()
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
