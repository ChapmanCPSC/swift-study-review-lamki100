//
//  GameViewController.swift
//  SwiftStudyApp
//
//  Created by Katie on 3/21/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var timer = NSTimer()
    var seconds = 0
    
    var terms : [String] = []
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set terms
        self.terms = [ "Let vs. Var", "Computer Initializers", "Computed Variables", "Setter Observers", "Functions",
        "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers",
        "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding",
        "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Setter Observers" ]
        
        // shuffle list order
        self.terms = terms.shuffle();
        
        // set to first term
        self.termLabel.text = terms.removeFirst()
        
        // start timer
        self.seconds = 30
        self.timerLabel.text = "0:\(String(format: "%02d", seconds))"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTerm(sender: AnyObject) {
        
        if (self.terms.count != 0)
        {
            // set to first term
            self.termLabel.text = terms.removeFirst()
            
            // reset timer
            self.seconds = 30
            self.timerLabel.text = "0:\(String(format: "%02d", seconds))"
        }
        else
        {
            // done pop up
            self.termLabel.text = "WELL DONE"
            self.timerLabel.text = "0:00"
            self.timer.invalidate()
        }
    }
    
    func subtractTime()
    {
        seconds -= 1
        self.timerLabel.text = "0:\(String(format: "%02d", seconds))"
        if (seconds <= 0)
        {
            self.timer.invalidate()
        }
    }
    
}