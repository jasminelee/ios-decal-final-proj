//
//  TimerViewController.swift
//  SleepBee
//
//  Created by Alexis Tran on 11/19/16.
//  Copyright © 2016 Alexis Tran. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {


    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func startTimer(_ sender: UIButton) {
        timerLabel.text = "Timer Started"
        timer = Timer.scheduledTimer(timeInterval: timeInterval,                                                       target: self,                                                       selector: Selector(("timerDidEnd:")),                                                       userInfo: "Bzz bzz! Time to wake up!",                                                       repeats: false)
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timerLabel.text = "Timer Stopped"
        timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
    }
    
    var timer = Timer() //make a timer variable, but don't do anything yet
    let timeInterval:TimeInterval = 10.0
    
    //MARK: - Instance Methods
    func timerDidEnd(timer:Timer){
        //first iteration of timer
        timerLabel.text = timer.userInfo as? String
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
