//
//  RegisterUserScreen.swift
//  FirebaseTestingMKII
//
//  Created by Dakota Brown on 10/24/18.
//  Copyright © 2018 Dakota Brown. All rights reserved.
//

import UIKit
import Firebase

class RegisterUserScreen: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blur.jpg")!)
        username.underlined()
        username.text = ""
        email.underlined()
        email.text = ""
        password.underlined()
        password.text = ""
        confirmPassword.underlined()
        confirmPassword.text = ""
    }
    
    func displayError(title: String, message: String) {
        let title = title
        let message = message
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func registerUser(_ sender: Any) {
        
        guard let username = username.text, !username.isEmpty else {
            displayError(title: "Missing username", message: "Please enter a Username.")
            return
        }
        
        guard let email = email.text, !email.isEmpty else {
            displayError(title: "Missing email", message: "Please enter an Email.")
            return
        }
        
        guard let password = password.text, !password.isEmpty else {
            displayError(title: "Missing password", message: "Please enter a password.")
            return
        }
        
        guard let confirmPassword = confirmPassword.text, !confirmPassword.isEmpty else {
            displayError(title: "Missing Confirm Password", message: "Please Confirm Password.")
            return
        }
        
        if confirmPassword != password {
            displayError(title: "Passwords don't match", message: "Please make sure the passwords match")
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("User created")
                self.performSegue(withIdentifier: "toLogin", sender: self)
            }
            if error != nil {
                self.displayError(title: "Email or Password void", message: "Enter a valid Email or Password")
            }
        }
    }
}
