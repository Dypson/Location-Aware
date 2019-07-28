//
//  ViewController.swift
//  Location Aware
//
//  Created by Deepson on 7/26/19.
//  Copyright © 2019 Deepson. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var lblDisplay: UILabel!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
       // locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var nearestAddress = ""
        
       /* print("Altitude: " + String(locations[0].altitude))
        print("Speed: " + String(locations[0].speed))
        print("Course: "+String(locations[0].course))
        print("Latitude:"+String(locations[0].coordinate.latitude))
        print("Longitude: "+String(locations[0].coordinate.longitude)) */
        
        CLGeocoder().reverseGeocodeLocation(locations[0]) {(placemarks,error) in
            if error != nil{
                 print("Error Found")
            }else{
                nearestAddress=(placemarks?[0].subThoroughfare!)!+" "+(placemarks?[0].thoroughfare)!+"\n"+(placemarks?[0].subAdministrativeArea)!+"\n"+(placemarks?[0].postalCode)!+"\n"+(placemarks?[0].country)!
               //print(nearestAddress)
          self.lblDisplay.text=nearestAddress

            }
            
        }
       
    }

}

