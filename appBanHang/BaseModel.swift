//
//  BaseModel.swift
//  appBanHang
//
//  Created by datnguyen on 1/3/17.
//  Copyright © 2017 datnguyen. All rights reserved.
//

import Foundation
import UIKit

protocol BaseModel {
    var id:String{get set}
    init(object:Any)
}

