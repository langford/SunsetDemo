//
//  ViewController.swift
//  SunsetDemo
//
//  Created by Michael Langford on 5/2/17.
//  Copyright © 2017 Michael Langford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var sinceSunset: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        
        local?.text = formatter.string(from: Date())
        sinceSunset?.text = "???"
        let localTZ = NSTimeZone.local as NSTimeZone
        guard let approxLocation = localTZ.approximateLocation(),
              let sunsetTime = approxLocation.sunsetDate() else{
            return
        }
        sinceSunset?.text = formatter.string(from: sunsetTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

