//
//  Collcell2.swift
//  appBanHang
//
//  Created by datnguyen on 12/22/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit
class CollCell2:basecollCell{
    let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "menu")
        return img
    }()
    
    var video:Video = Video()
    override func setupSub() {
        imgView.loadImageOnline(link: video.linkVideo)
    }
    override func setup() {
        //print("a")
        backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        addSubview(imgView)
        addContrainsWithVS(format: "V:|[v0]|", views: imgView)
        addContrainsWithVS(format: "H:|[v0]|", views: imgView)
    }
}

