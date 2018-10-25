//
//  LoginScreen.swift
//  FirebaseTestingMKII
//
//  Created by Dakota Brown on 10/24/18.
//  Copyright © 2018 Dakota Brown. All rights reserved.
//

import UIKit
import Firebase

class LoginScreen: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dividerLabel1: UILabel!
    @IBOutlet weak var dividerLabel2: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Login.jpg")!)
        email.underlined()
        email.text = ""
        password.underlined()
        password.text = ""
        dividerLabel1.underlined()
        dividerLabel2.underlined()
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
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if user != nil {
                print("User logged in")
                self.performSegue(withIdentifier: "toUserScreens", sender: self)
            }
            if error != nil {
                self.displayError(title: "Email or Password void", message: "Enter a valid Email or Password")
            }
        }
    }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) { }
}
