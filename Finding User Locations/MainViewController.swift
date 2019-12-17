//
//  MainViewController.swift
//  Finding User Locations
//
//  Created by Deepson Khadka on 12/16/19.
//  Copyright © 2019 Deepson. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var inputSpeed = ""
    
    @IBOutlet weak var lblInput: UITextField!
    @IBAction func btnShowMap(_ sender: Any) {
        self.inputSpeed = lblInput.text!
        performSegue(withIdentifier: "mapScene", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        var vc = segue.destination as! ViewController
        vc.finalSpeed=inputSpeed
    }
    @IBAction func btnSlider(_ sender: UISlider) {
        lblInput.text=String(Int(sender.value))
    }
    
    }
