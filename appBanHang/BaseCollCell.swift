//
//  BaseCollCell.swift
//  appBanHang
//
//  Created by datnguyen on 12/22/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class basecollCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override func layoutSubviews() {
        setupSub()
    }
    func setupSub(){
    
    }
    func setup(){
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
