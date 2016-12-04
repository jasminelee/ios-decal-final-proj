//
//  FirstViewController.swift
//  SleepBee
//
//  Created by Alexis Tran on 11/19/16.
//  Copyright © 2016 Alexis Tran. All rights reserved.
//

import UIKit

class ChooseNapDurationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var time = TimeInterval()
    
    @IBAction func updateFifteen(_ sender: AnyObject) {
        time = (15.0 * 60.0)
        self.performSegue(withIdentifier: "segue", sender: sender)
    }

    @IBAction func updateThirty(_ sender: AnyObject) {
        time = (30.0 * 60.0)
        self.performSegue(withIdentifier: "segue", sender: sender)
    }
    
    @IBAction func updateSixty(_ sender: AnyObject) {
        time = (60.0 * 60.0)
        self.performSegue(withIdentifier: "segue", sender: sender)
    }
    
    @IBAction func updateNinety(_ sender: AnyObject) {
        time = (30.0 * 60.0)
        self.performSegue(withIdentifier: "segue", sender: sender)
    }
    @IBOutlet weak var customTime: UITextField!
    @IBAction func custom(_ sender: AnyObject) {
        time = (TimeInterval(customTime.text!)! * 60.0)
        self.performSegue(withIdentifier: "segue", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "sound" {
            let secondView: TimerViewController = segue.destination as! TimerViewController
            secondView.timerEnd = time
        }
        
    }
}

