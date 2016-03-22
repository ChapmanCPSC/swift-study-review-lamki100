//
//  GameViewController.swift
//  SwiftStudyApp
//
//  Created by Katie on 3/21/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    // variables for timer
    var timer = NSTimer()
    var seconds = 0
    var running : Bool = false
    
    // variable for term
    var terms : [String] = []
    
    // keeping score
    var rightTerms = 0
    var wrongTerms = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
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
        
        self.running = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func subtractTime()
    {
        seconds -= 1
        self.timerLabel.text = "0:\(String(format: "%02d", seconds))"
        if (seconds <= 0)
        {
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
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        if (!self.running)
        {
            return
        }
        
        // if its swiped left
        if (sender.direction == .Left)
        {
            let labelPosition = CGPointMake(self.swipeView.frame.origin.x - 50.0, self.swipeView.frame.origin.y);
            swipeView.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeView.frame.size.width, self.swipeView.frame.size.height)
            
            self.wrongTerms += 1
            // update labels at the bottom
            
        }
        // if it is swiped right
        if (sender.direction == .Right)
        {
            let labelPosition = CGPointMake(self.swipeView.frame.origin.x + 50.0, self.swipeView.frame.origin.y);
            swipeView.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeView.frame.size.width, self.swipeView.frame.size.height)
            
            self.rightTerms += 1
            // update labels at the bottom
            
        }
        
        // change terms
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
            self.running = false
        }
    }
    
}