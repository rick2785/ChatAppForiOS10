//
//  SignInVC.swift
//  ChatAppForiOS10
//
//  Created by Rickey Hrabowskie on 11/29/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    private let CONTACTS_SEGUE = "ContactsSegue"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthProvider.Instance.isLoggedIn() {
            performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
        }
    }

    @IBAction func login(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem with Authentication", message: message!)
                } else {
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                }
            })
        } else {
            alertTheUser(title: "Email and Password are Required", message: "Please enter email and password in the text fields")
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthProvider.Instance.signUp(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem with creating a new user", message: message!)
                } else {
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                }
            })
        } else {
            alertTheUser(title: "Email and Password are Required", message: "Please enter email and password in the text fields")
        }
    }

    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}

