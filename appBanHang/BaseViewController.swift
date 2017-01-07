//
//  BaseViewController.swift
//  appBanHang
//
//  Created by datnguyen on 1/3/17.
//  Copyright © 2017 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController:UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    func setup(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    let imageView:UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        return imgv
    }()
}
