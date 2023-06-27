//
//  Welcome.swift
//  Login
//
//  Created by Welcome Sandy  on 13/06/23.
//

import UIKit

class Welcome: UIViewController {

    @IBOutlet var label: UILabel!
    
    let vm1 = SecondViewController()
    
    let vm3 = PersonalDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func details(_ sender: UIButton) {
        
        if let personalVC = self.storyboard?.instantiateViewController(identifier: "personal") as? PersonalDetails{
            self.navigationController?.pushViewController(personalVC, animated: true)
        }
//        let vc = self.storyboard?.instantiateViewController(identifier:"personal") as! PersonalDetails
//        vc.nme = vm1.name.text!
//        vc.eml = vm1.emailField.text!
//        vc.pass = vm1.passwordField.text!
//        vc.phn = vm1.phoneNumber.text!
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

    
}

