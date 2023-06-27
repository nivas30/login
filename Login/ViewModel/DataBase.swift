//
//  DataBase.swift
//  Login
//
//  Created by Welcome Sandy  on 13/06/23.
//

import Foundation
import FirebaseAuth
import UIKit

public class LoginViewModel{
    
    public func fireBaseCreate(email: String, password:String) {
        FirebaseAuth.Auth.auth().createUser(withEmail:email , password: password , completion: {result,error in
            guard error == nil else{
                
                return
            }
            print("you are signed in")
        })
        
    }
    
    public func fireBaseSign(Email: String, Password:String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: Email, password: Password , completion:{result,error in
            guard error == nil else{
                
                return
            }
            print("you are signed in")
        })
        
    }
    
    
    
    
    
    
    
}


