//
//  ViewController.swift
//  Login
//
//  Created by Welcome Sandy  on 13/06/23.
//

import UIKit
import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices

class ViewController: UIViewController , ASAuthorizationControllerDelegate {
    
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    let viewModel1 = LoginViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    
    
    @IBAction func Login(_ sender: UIButton) {
        
        Validate()
       
    }

    
    
    
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "CREATEACCOUNT") as? SecondViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
        
    }
    
    @IBAction func GoogleSign(_ sender: UIButton) {
        GoogleSign()
    }
    
    @IBAction func AppleSign(_ sender: UIButton){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        
    }
}

extension ViewController {
    func GoogleSign() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            if let loginVC = self.storyboard?.instantiateViewController(identifier: "WELCOMEPAGE") as? Welcome{
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
            //            debugPrint("Data is \(signInResult?.debugDescription)")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(identifier: "WELCOMEPAGE")
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true)
            
        }
    }
    
//    func setUpSignInAppleButton() {
//        let authorizationButton = ASAuthorizationAppleIDButton()
//        authorizationButton.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
//        authorizationButton.cornerRadius = 10
//
//
//        //Add button on some view or stack
//    }
    
    @objc func handleAppleIdRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        
       
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("User id is \(userIdentifier) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")
            
            
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userIdentifier) {  (credentialState, error) in
                 switch credentialState {
                    case .authorized:
                        print("authorized")
                        break
                    case .revoked:
                        // The Apple ID credential is revoked.
                     print("revoked")
                        break
                 case .notFound: break
                        // No credential was found, so show the sign-in UI.
                    default:
                        break
                 }
            }
        }
      
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("!error")
    }
}

extension ViewController {
    func Validate(){
        if let email = emailField.text, let password = passwordField.text{
            if !email.isValidEmail(){
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else if !password.isValidPassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else{
                viewModel1.fireBaseSign(Email: email, Password: password)
                if let loginVC = self.storyboard?.instantiateViewController(identifier: "WELCOMEPAGE") as? Welcome{
                    self.navigationController?.pushViewController(loginVC, animated: true)
                }
            }
        }else{
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
    
}

    



