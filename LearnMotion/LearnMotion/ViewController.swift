//
//  ViewController.swift
//  LearnMotion
//
//  Created by Gavin Chan on 10/24/15.
//  Copyright © 2015 Gavin Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    let notifier = NSNotificationCenter.defaultCenter()
    var recording: Bool! = false
    
    //storage for x, y, z values from accelvectors
    var x_arr: [Float]! = []
    var y_arr: [Float]! = []
    var z_arr: [Float]! = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func connectButtonTapped(sender: UIButton) {
        let controller: UINavigationController = TLMSettingsViewController.settingsInNavigationController()
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func practiceButton(sender: UIButton) {
        self.recording = !self.recording
        
        //add the observer after the button is pressed
        // Notifications accelerometer event are posted at a rate of 50 Hz.
        
        if ((recording) != nil) {
            print("Recording...")
//            self.statusLabel.text = "On"
            
            notifier.addObserver(self, selector: "didRecieveAccelerationEvent:", name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
        }
            //
        else {
            //remove the listener
//            self.statusLabel.text = "Off"
            print("Stopped Recording")
            notifier.removeObserver(TLMMyoDidReceiveAccelerometerEventNotification)
        }

    }
    
    func didConnectDevice(notification: NSNotification) -> Void {
        // First try to cast user info to expected type
        if let info = notification.userInfo as? Dictionary<String, TLMMyo> {
            // Check if value present before using it
            if let myo = info[kTLMKeyMyo] {
                print(myo)
                print("connected to: ", myo.name)
            }
            else {
                print("no value for key\n")
            }
        }
        else {
            print("wrong userInfo type")
        }
        
        //set acceleration bar and stuff later?
    }
    
    func didDisconnectDevice(notification: NSNotification) -> Void {
        //access the disconnected device.
        // First try to cast user info to expected type
        if let info = notification.userInfo as? Dictionary<String, TLMMyo> {
            // Check if value present before using it
            if let myo = info[kTLMKeyMyo] {
                print("connected to: ", myo.name)
            }
            else {
                print("no value for key\n")
            }
        }
        else {
            print("wrong userInfo type")
        }
    }
    
    //will be called every 50 ms
    func didReceiveAccelerometerEvent(notification: NSNotification) -> Void {
        print("I'm getting accelerations!!!!")
        if let info = notification.userInfo as? Dictionary<String, TLMAccelerometerEvent> {
            if let accelEvent = info[kTLMKeyAccelerometerEvent] {
                print(accelEvent)
                let accelVector: TLMVector3! = accelEvent.vector
                
////                calculate the magnitude of the accel vector
//                let magnitude: Float! = TLMVector3Length(accelVector)
                
                
                let x: Float! = accelVector.x
                let y: Float! = accelVector.y
                let z: Float! = accelVector.z
                
                self.x_arr.append(x)
                self.y_arr.append(y)
                self.z_arr.append(z)
                
                self.statusLabel.text = "GETTING ACCELERATIONS"

                
            }
        }
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

