//
//  ProfileViewController.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColor(view: self.view)

        profileView(view: profileBackgroundView)
        // Do any additional setup after loading the view.
    }
    


}
