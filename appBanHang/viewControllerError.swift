//
//  viewControllerError.swift
//  appBanHang
//
//  Created by datnguyen on 1/3/17.
//  Copyright © 2017 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerError: BaseViewController {
    override func setup() {
        super.setup()
        imageView.image = UIImage(named: "errorConnect")
        view.addSubview(imageView)
        view.addContrainsWithVS(format: "V:|[v0]|", views: imageView)
        view.addContrainsWithVS(format: "H:|[v0]|", views: imageView)
    }
}
