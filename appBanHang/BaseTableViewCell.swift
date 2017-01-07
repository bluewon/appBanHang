//
//  BaseTableViewCell.swift
//  appBanHang
//
//  Created by datnguyen on 12/20/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell:UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    func setup(){
        backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
