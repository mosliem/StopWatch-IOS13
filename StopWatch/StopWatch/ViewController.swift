//
//  ViewController.swift
//  StopWatch
//
//  Created by mohamedSliem on 3/26/21.
//  Copyright © 2021 mohamedSliem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var count = 0
    var hours = 0
    var min = 0
    
    @IBAction func keyPressed(_ sender: UIButton)
    {
        let action = sender.currentTitle! // save the user chosed button
        if action == "Start"
        {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        else if action == "Reset"
        {
            timer.invalidate()
            timeLabel.text = "00:00:00"
            count = 0
            hours = 0
            min = 0
        }
        else
        {
            timer.invalidate()
            
        }
    }
    
   //object function from c-objective to update the counter of the timer and checking the number of seconds
    @objc func updateCounter()
    {
        if count < 59
        {
        count += 1
        representTime()
            
        }
        else
        {
            secToMin()
            minToHours()
         representTime()
        }
    }
    
    // function to convert the minutes to hours
    func minToHours()
    {
     if min == 59
     {
      hours += 1
      self.min = 0
     }
    }
 
//function to convert the seconds to minutes
    func secToMin(){
        min += 1
        self.count = 0
 
    }
    
    // function to represnt the time updated in the format 00:00:00
    
    func representTime()
    {
        var seconds : String = " "
        var min : String = " "
        var hours : String = " "
        
        // check if the number of the seconds, min or hours is less than 9 or not . to represent it in right format
        
        seconds = String(format: "%02d", self.count)
        min = String(format: "%02d", self.min)
        hours = String(format: "%02d", self.hours)
        
        timeLabel.text = "\(hours):\(min):\(seconds)"
    }
}

