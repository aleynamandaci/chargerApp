//
//  CitiesViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit

class CitiesViewController: UIViewController {
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.attributedPlaceholder = customTextField(string: "Şehir Ara", color: grayScale)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundColor(view: self.view)
        searchBar(view: searchBarView)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
