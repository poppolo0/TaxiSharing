//
//  LoginTXViewController.swift
//  TaxiSharing
//
//  Created by Mauriello Lorenzo on 29/09/2017.
//  Copyright © 2017 Mauriello Lorenzo. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginTXViewController: UIViewController {

    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accedi(_ sender: UIButton) {
        guard let email = self.mail.text, !email.isEmpty else {
            print("\n [Error] Write Username \n")
            return
        }
        guard let passw = self.pass.text, !email.isEmpty else {
            print("\n [Error] Write Username \n")
            return
        }
        Auth.auth().signIn(withEmail: email, password: passw, completion: { (user, error) in
            
            guard error == nil else {
                print(" \n [ERROR] Can't Sign In \n   withError: \(error.debugDescription, error!.localizedDescription) \n")
                return
            }
            
            print("\n Welcome \(user!.email!)")
            self.performSegue(withIdentifier: "segueHome", sender: nil)

        })
    }
    
    @IBAction func registrati(_ sender: UIButton) {
        guard let email = self.mail.text, !email.isEmpty else {
            print("\n [Error] Write Username \n")
            return
        }
        guard let passw = self.pass.text, !email.isEmpty else {
            print("\n [Error] Write Username \n")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: passw, completion: { (user, error) in
            guard error == nil else {
                print(" \n [ERROR] Can't create an Account \n   withError: \(error.debugDescription, error!.localizedDescription) \n")
                return
            }
            
            print("\n Welcome \(user!.email!)")
            
        })

        
    }

}
