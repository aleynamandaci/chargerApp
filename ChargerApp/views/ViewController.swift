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
    
    var user = User()
    
    @IBOutlet weak var emailField: UITextField! {
        didSet {
            emailField.attributedPlaceholder = customTextField(string: "E-POSTA ADRESİNİZ", color: grayScale)
        }
    }
    @IBOutlet weak var textFieldView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor(view: self.view)
        
        let thickness: CGFloat = 2.0
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0, y: self.textFieldView.frame.size.height - thickness, width: self.textFieldView.frame.size.width, height:thickness)
        bottomBorder.backgroundColor = grayScale.cgColor
        textFieldView.layer.addSublayer(bottomBorder)
        
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
    

