//
//  SignInViewController.swift
//  Booster Dream
//
//  Created by DUPRAY COM & CO on 27/09/2018.
//  Copyright © 2018 Booster Dream. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            
            return
        }
        
        activityIndicator.startAnimating()
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            self.activityIndicator.stopAnimating()
            
            if let _ = user, error == nil {
                
                let del = UIApplication.shared.delegate as? AppDelegate
                
                del?.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main")
                del?.window?.makeKeyAndVisible()
            }
            
            else {
                
                self.showAlertWithOkButton(title: "Mauvais identifiants", body: "Veuillez réessayer.")
            }
        }
    }
    
    
    func showAlertWithOkButton (title: String, body: String) {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
