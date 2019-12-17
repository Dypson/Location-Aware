//  ViewController.swift
//  Finding User Location
//  Created by Deepson on 7/24/19.
//  Copyright © 2019 Deepson. All rights reserved.
//Source: Stack OverFlow

import UIKit
import MapKit
import CoreLocation
import AudioToolbox
import AVFoundation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    var finalSpeed = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[0]
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
       // print("My location is: "+String(location.speed))
       let systemSoundID: SystemSoundID = 1016
        let _maxSpeed: Double = Double(finalSpeed.trimmingCharacters(in: .whitespaces))!//Double(lblInput.text!)!
        let mySpeed: Double = Double(location.speed)
        print("Maximum Speed Limit: "+finalSpeed+" mph")
        if mySpeed.isLess(than: _maxSpeed){
            lblDisplay.text=String(location.speed)+" mph"
             print("Current Speed: "+String(location.speed)+" mph")
            }else{
            // to play sound
            AudioServicesPlaySystemSound (systemSoundID)
             AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            print("Speed Limit Crossed: "+String(location.speed)+" mph")
            }
        self.map.setRegion(region, animated: true)
    }
    
    @IBAction func dismissSegue(_ sender: Any) {
        
    }
}

