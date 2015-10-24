//
//  ViewController.swift
//  myoSportiOS
//
//  Created by Gavin Chan on 10/23/15.
//  Copyright © 2015 Gavin Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var t1: [Double]! = [1, 2, 3, 4.5]
    var t2: [Double]! = [1, 2, 3, 4.5]

    @IBAction func calcButtonTouched(sender: AnyObject) {
        print("hello")
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let diff = appDelegate.dtw.dtw_distance(self.t1, t2: self.t2)
        print(diff)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

