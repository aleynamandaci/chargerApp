//
//  ApiHelper.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 12.07.2022.
//

import UIKit


func postRequest(url : String , parameters: [String: Any] , token : String?) {
    let parameters = parameters
  
  // create the url with URL
  let url = URL(string: url)!
    
  // create the session object
  let session = URLSession.shared
  
  // now create the URLRequest object using the url object
  var request = URLRequest(url: url)
  request.httpMethod = "POST" //set http method as POST
  
  // add headers for the request
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
    if token != nil {
        request.addValue("\(token)", forHTTPHeaderField: "token")
    }
  
  do {
    // convert parameters to Data and assign dictionary to httpBody of request
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
  } catch let error {
    print(error.localizedDescription)
      return
  }
  
  // create dataTask using the session object to send data to the server
    let task = session.dataTask(with: request) { data, response, error in
    
    if let error = error {
      print("Post Request Error: \(error.localizedDescription)")
      return
    }
    
    
    // ensure there is data returned
    guard let responseData = data else {
      print("nil Data received from the server")
      return
    }
      
    do {
      // create json object from data or use JSONDecoder to convert to Model stuct
        
        
        if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
            
            
            
        print(jsonResponse)
        // handle json response
            
            
      } else {
        print("data maybe corrupted or in wrong format")
        throw URLError(.badServerResponse)
      }
        
    
    }
      catch let error {
      print(error.localizedDescription)
    }
      
  }
  // perform the task
  task.resume()
    
}

/*
func getRequest (parameters : [String : Any]) {
    // Create URL
    let url = URL(string: "http://ec2-18-197-100-203.eu-central-1.compute.amazonaws.com:8080/provinces")
    guard let requestUrl = url else { fatalError() }

    // Create URL Request
    var request = URLRequest(url: requestUrl)

    // Specify HTTP Method to use
    request.httpMethod = "GET"
    
    request.setValue("GEWk_NAX3de9zMWEVahH7cwzvF2sNqhx", forHTTPHeaderField: "token")
    
    do {
      // convert parameters to Data and assign dictionary to httpBody of request
      request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    } catch let error {
      print(error.localizedDescription)
        return
    }

    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString)")
        }
        
    }
    task.resume()
}
*/
