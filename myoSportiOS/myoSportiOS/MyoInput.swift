//
//  MyoInput.swift
//  myoSportiOS
//
//  Created by Gavin Chan on 10/24/15.
//  Copyright © 2015 Gavin Chan. All rights reserved.
//

import Foundation
//import TLMAccelerometerEvent

class MyoInput: NSObject, NSCopying {
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var myoHub = appDelegate.myoHub
    
    var TLM
    
    
    
}