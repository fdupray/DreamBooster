//
//  SignUpViewController.swift
//  Booster Dream
//
//  Created by DUPRAY COM & CO on 27/09/2018.
//  Copyright © 2018 Booster Dream. All rights reserved.
//

import UIKit
import Stripe

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var businessNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if self.fieldsAreValid() {
            
            let user = DBUser()
            
            user.adresse = addressTextField.text
            user.nomDeBoite = businessNameTextField.text
            user.email = emailTextField.text
            user.password = passwordTextField.text
            user.numeroTelephone = numberTextField.text
            user.username = usernameTextField.text
            
            user.signUpInBackground { (success, error) in
                
                if let error = error {
                    
                    print(error.localizedDescription)
                }
                
                else {
                    
                    let del = UIApplication.shared.delegate as? AppDelegate
                    
                    del?.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main")
                    del?.window?.makeKeyAndVisible()
                }
            }
        }
    }
    
    func fieldsAreValid () -> Bool {
        
        if emailTextField.text == nil || !self.isValidEmail(testStr: emailTextField.text!) {
            
            self.emailTextField.textColor = .red
        }
        
        else if usernameTextField.text == nil {
            
            self.usernameTextField.textColor = .red
        }
        
        else if passwordTextField.text == nil {
            
            self.passwordTextField.textColor = .red
        }
        
        else {
            
            return true
        }
        
        return false
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
