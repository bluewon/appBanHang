//
//  API.swift
//  appBanHang
//
//  Created by datnguyen on 1/3/17.
//  Copyright © 2017 datnguyen. All rights reserved.
//

import Foundation
import UIKit

enum API:String{
    case postImage = "postImage.php"
    case getSP = "GETSP.php"
    case dataJson = "data.json"
    case getCata = "Cata.php"
    var fullLink:String{
        return "http://hidaacademy.com/" + self.rawValue
    }
}



