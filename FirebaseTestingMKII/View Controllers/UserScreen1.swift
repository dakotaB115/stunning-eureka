//
//  UserScreen1.swift
//  FirebaseTestingMKII
//
//  Created by Dakota Brown on 10/24/18.
//  Copyright © 2018 Dakota Brown. All rights reserved.
//

import UIKit
import Firebase

class UserScreen1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.performSegue(withIdentifier: "toLogin", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
