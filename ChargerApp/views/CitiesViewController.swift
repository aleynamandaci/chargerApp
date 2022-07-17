//
//  CitiesViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit
import Alamofire

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cityNumber = 0
    var cities : [String]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 81
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell
        //cell.cityName.text = cities[indexPath.row]
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = UIColor.clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        return cell
    }
    
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor(view: self.view)
        
        let nib = UINib(nibName: "CitiesTableViewCell", bundle: nil)
        citiesTableView.register(nib, forCellReuseIdentifier: "CitiesTableViewCell")
        // Do any additional setup after loading the view.
        getCities()
        
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
    }
    
    func getCities(){
        let url = URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces")!
        
        let headers : HTTPHeaders = [
            "Accept": "application/json",
            "token": token
        ]
        
        let parameters: [String: Any] = [
            "userID" : userID
        ]
        
        
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { (data) in
                print(data.result)
                
                //self.cities = data.value as! [String]
                
            }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true) {
        }
    }
    
    
    
}
