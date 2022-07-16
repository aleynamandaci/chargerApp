//
//  ProfileViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor(view: self.view)

        profileView(view: profileBackgroundView)
        
        idLabel.text = String(UIDevice.current.identifierForVendor!.uuidString)
        emailLabel.text = email
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIButton) {
        let url = URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/auth/logout/\(userID)")!
        var request = URLRequest(url: url)
        
      
        request.httpMethod = "POST"
        
        let headers : HTTPHeaders = [
          "Accept": "application/json",
          "token": token
        ]
        
        request.headers = headers

       
         AF.request(request)
            .responseDecodable(of: User.self) { (response) in
               guard let result = response.value else { return }
                print(result)
                //token = result.token!
                //userID = result.userID!
                
                
             }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true) {
        }
    }
    
}
