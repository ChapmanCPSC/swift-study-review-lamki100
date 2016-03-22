//
//  ReviewViewController.swift
//  SwiftStudyApp
//
//  Created by Katie on 3/21/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    // variables for timer
    var timer = NSTimer()
    var seconds = 0
    
    // variable for term
    var terms : [String] = []
    
    @IBOutlet weak var termLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set terms
        self.terms = [ "Let vs. Var", "Computer Initializers", "Computed Variables", "Setter Observers", "Functions",
            "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers",
            "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding",
            "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Setter Observers" ]
        
        // set to first term
        self.termLabel.text = terms.removeFirst()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTerm(sender: AnyObject)
    {
        if (self.terms.count != 0)
        {
            // set to first term
            self.termLabel.text = terms.removeFirst()
        }
        else
        {
            // start over
            // set terms
            self.terms = [ "Let vs. Var", "Computer Initializers", "Computed Variables", "Setter Observers", "Functions",
                "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers",
                "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding",
                "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Setter Observers" ]
            
            // set to first term
            self.termLabel.text = terms.removeFirst()
        }
    }
    
}
