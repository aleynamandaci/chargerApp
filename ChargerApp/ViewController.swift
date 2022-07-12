//
//  ViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 29.06.2022.
//

import UIKit
import CoreLocation
import UserNotifications

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // get location later
                }
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //postRequest()
        postRequest(url: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login", parameters: ["email": emailField.text!, "deviceUDID": String(UIDevice.current.identifierForVendor!.uuidString)], token: nil)
    }
    
    
    

}

