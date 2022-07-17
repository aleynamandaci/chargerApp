//
//  ViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 29.06.2022.
//

import UIKit
import CoreLocation
import UserNotifications
import Alamofire

var token : String = ""
var userID : Int = 0
var email : String = ""

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    
    
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
        
        registerForPushNotifications()


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
    
    func registerForPushNotifications() {
      //1
      UNUserNotificationCenter.current()
        //2
        .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
          //3
          print("Permission granted: \(granted)")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let url = URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/login")!
        var request = URLRequest(url: url)
        
      
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "email" : emailField.text,
            "deviceUDID" : String(UIDevice.current.identifierForVendor!.uuidString),
            
        ]

        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

       
         AF.request(request)
            .responseDecodable(of: User.self) { (response) in
               guard let result = response.value else { return }
                print(result.email)
                print(result.userID)
                print(result.token)
                token = result.token!
                userID = result.userID!
                email = result.email!
                
                
             }
        
        performSegue(withIdentifier: "AppointmentsViewController", sender: nil)
        
    
        
    }
    

}
