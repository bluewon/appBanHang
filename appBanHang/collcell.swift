//
//  collcell.swift
//  appBanHang
//
//  Created by datnguyen on 12/22/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class collcell1:basecollCell{
    lazy var coll:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let c = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.register(CollCell2.self, forCellWithReuseIdentifier: "Coll2")
        c.backgroundColor = UIColor.clear
        c.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        c.delegate = self
        c.dataSource = self
        return c
    }()
    func setupColl(){
        addSubview(coll)
        addContrainsWithVS(format: "V:|[v0]|", views: coll)
        addContrainsWithVS(format: "H:|[v0]|", views: coll)
    }
    override func setup() {
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        setupColl()
        print(listvideo)
    }
    var listvideo:Array<Video> = []
}

extension collcell1:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listvideo.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll2", for: indexPath) as! CollCell2
        //print(listvideo)
        cell.video = listvideo[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.height - 10, height: frame.size.height - 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("da nhan nut xanh")
        NotificationCenter.default.post(name: NSNotification.Name.init("clickXanh"), object: listvideo[indexPath.row])
        //self.present
    }
}
