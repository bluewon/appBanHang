//
//  Cell1.swift
//  appBanHang
//
//  Created by datnguyen on 12/20/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit
class Cell:BaseTableViewCell{
    let lblKH:UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return lbl
    }()
    override func setup() {
        super.setup()
        addSubview(lblKH)
        lblKH.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblKH.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblKH.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        lblKH.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        lblKH.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}

