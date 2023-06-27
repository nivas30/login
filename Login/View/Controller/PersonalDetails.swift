//
//  PersonalDetails.swift
//  Login
//
//  Created by Welcome Sandy  on 22/06/23.
//

import UIKit

class PersonalDetails: UIViewController {
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var email: UILabel!
    
    @IBOutlet var password: UILabel!
    
    @IBOutlet var phoneNumber: UILabel!
    
    
    var nme: String = ""
    var eml: String = ""
    var pass: String = ""
    var phn: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text =  nme
        email.text = eml
        password.text = pass
        phoneNumber.text = phn
    }
    
    
}


