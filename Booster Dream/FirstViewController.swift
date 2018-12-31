//
//  FirstViewController.swift
//  Booster Dream
//
//  Created by DUPRAY COM & CO on 17/09/2018.
//  Copyright © 2018 Booster Dream. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonView.layer.cornerRadius = 8
        
        let path = CGMutablePath()
        path.addRect(buttonView.bounds)
        
        buttonView.layer.shadowPath = path
        
        buttonView.layer.shadowRadius = 5
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowColor = UIColor.lightGray.cgColor
        
        if let user = DBUser.current() {
            
            self.companyName.text = user.nomDeBoite!
            self.emailAddress.text = user.email!
            self.phoneNumber.text = user.numeroTelephone!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

