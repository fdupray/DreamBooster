//
//  DBUser.swift
//  Booster Dream
//
//  Created by DUPRAY COM & CO on 27/09/2018.
//  Copyright © 2018 Booster Dream. All rights reserved.
//

import UIKit
import Parse

class DBUser: PFUser {

    @NSManaged var numeroTelephone: String?
    
    @NSManaged var nomDeBoite: String?
    
    @NSManaged var adresse: String?
    
    @NSManaged var numeroDeVoie: Int
    @NSManaged var codePostal: Int
    @NSManaged var rue: String?
    @NSManaged var region: String?
}
