//
//  SecondViewController.swift
//  Login
//
//  Created by Welcome Sandy  on 13/06/23.
//

import UIKit

public class SecondViewController: UIViewController {
    
    let viewModal = LoginViewModel()    
    
    @IBOutlet var name: UITextField!
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var conformPassword: UITextField!
    
    @IBOutlet var phoneNumber: UITextField!
    
    
    var fav: String = "hello"
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    
    }
    
    func favPet()->String{
        return fav
    }
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        Validate()
        
    }
    
    @IBAction func didPress(_ sender: UIButton) {
    }
    
    @IBAction func Login(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension SecondViewController {
    func Validate(){
        if let email = emailField.text, let password = passwordField.text , let userName = name.text  , let conformPswd = conformPassword.text , let phoneNumber = phoneNumber.text{
            if !userName.isUsername() {
                openAlert(title: "Alert", message: "Invalid Username", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else if !email.isValidEmail(){
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else if !password.isValidPassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else if (password != conformPswd){
                openAlert(title: "Alert", message: "Password does not match", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else if !phoneNumber.isPhoneNumber(){
                openAlert(title: "Alert", message: "Invalid phonenumber", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                viewModal.fireBaseCreate(email: email, password: password)
                
                
                passData()
            }
            
        }else{
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
    
    func passData(){
        let vc = self.storyboard?.instantiateViewController(identifier:"personal") as! PersonalDetails
        vc.nme = name.text!
        vc.eml = emailField.text!
        vc.pass = passwordField.text!
        vc.phn = phoneNumber.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}




