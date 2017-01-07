//
//  ViewController.swift
//  appBanHang
//
//  Created by datnguyen on 12/15/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewtrang:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var tblView:UITableView = {
        let tbl = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tbl.register(Cell.self, forCellReuseIdentifier: "Cell")
        tbl.register(Cell2.self, forCellReuseIdentifier: "Cell2")
        tbl.estimatedRowHeight = 100
        tbl.rowHeight = UITableViewAutomaticDimension
        tbl.dataSource = self
        return tbl
    }()
    
    lazy var collView:UICollectionView = {
        let coll:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.register(collcell1.self, forCellWithReuseIdentifier: "Coll")
        coll.delegate = self
        coll.dataSource = self
        return coll
    }()
    func setupCollView(){
        viewtrang.addSubview(collView)
        viewtrang.addContrainsWithVS(format: "V:|-64-[v0]|", views: collView)
        viewtrang.addContrainsWithVS(format: "H:|[v0]|", views: collView)
    }
    func setupMenubar(){
        view.addSubview(viewtrang)
        view.addContrainsWithVS(format: "V:|[v0]|", views: viewtrang)
        view.addContrainsWithVS(format: "H:|[v0]|", views: viewtrang)
    }
    func setupTableview(){
        view.addSubview(tblView)
        view.addContrainsWithVS(format: "V:|-64-[v0]|", views: tblView)
        view.addContrainsWithVS(format: "H:|[v0(200)]", views: tblView)
    }
    let arrChat:Array<String> = ["menu"," xin chào mọi người","Light-Pink-Background","sắp đến tết rồi, về nhà rất vui!","menu","tết tết tết","Light-Pink-Background","hôm nay trời không có mưa, đi đường không bị ướt, về nàh khô ráo, hôm nay trời không có mưa, đi đường không bị ướt, về nàh khô ráo"]
    func setugGesture(){
        let vuotDong:UISwipeGestureRecognizer = UISwipeGestureRecognizer()
        vuotDong.direction = .left
        vuotDong.addTarget(self, action: #selector(ViewController.menuDong(a:)))
        let vuotMo:UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer()
        vuotMo.edges = .left
        vuotMo.addTarget(self, action: #selector(ViewController.menuMo(_:)))
        viewtrang.addGestureRecognizer(vuotDong)
        viewtrang.addGestureRecognizer(vuotMo)
    }
    func menuDong(a sender:UIScreenEdgePanGestureRecognizer){
        print("dong")
        if sender.state == .ended{
            UIView.animate(withDuration: 3, animations: {
            self.action()
            })
        }
    }
    func menuMo(_ sender:UISwipeGestureRecognizer){
        print("mo")
        if sender.state == .ended{
            UIView.animate(withDuration: 3, animations: {
            self.action()
            })
        }
    }
    func selectXanh(object:Notification){
        print("da nhan duoc cu click")
        let vd = object.object as! Video
        let vc = view2()
        vc.video = vd
        self.navigationController?.pushViewController(vc, animated: true)
    }
    var arrPlaylist:Array<Playlist> = []
//    func loadData(){
//        //http://hidaacademy.com/data.json
//        loadJson(linkAPI: API.getCata) { (objectJson) in
//            if objectJson == nil{
//            self.present(ViewControllerError(), animated: true, completion: nil)
//            }else{
//                let object:Array<AnyObject> = objectJson as! Array<AnyObject>
//                for i in object{
//                let playlist:Playlist = Playlist(object: i)
//                self.arrPlaylist.append(playlist)
//                }
//                //print(self.arrPlaylist)
//                // xem lai
//                 self.collView.reloadData()
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //["index":0,"numberPages":4]
//        loadJson(linkAPI: API.getSP,parameter: "index=0&numberPages=4") { (object) in
//            print(object)
//        }
        
        
        //http://hidaacademy.com/
        let img = UIImage(named: "menu")
        loadJson(linkAPI: API.postImage, method: .post, parameter: ["file":img,"sa":"sa"]) { (object) in
            print(object!)
        }
//        loadData(urlString: API.postImage, param: ["file":UIImage(named:"Light-Pink-Background")], method: .post) { (o) in
//            print(o)
//        }
        //loadData()
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.selectXanh), name: NSNotification.Name.init("clickXanh"), object: nil)
        
        setupTableview()
        setupMenubar()
        setugGesture()
        setupCollView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.navigationItem.title = "Home"
        let LeftButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(ViewController.action))
        self.navigationItem.leftBarButtonItem = LeftButton
    }
    var isMenu:Bool = false
    func action(){
        if isMenu == false{
            let dichuyen = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
            UIView.animate(withDuration: 0, animations: {
                self.navigationController?.navigationBar.layer.transform = dichuyen
            }, completion: {(true) in
                self.viewtrang.layer.transform = dichuyen
            })
        }else{
                self.navigationController?.navigationBar.layer.transform = CATransform3DIdentity
                self.viewtrang.layer.transform = CATransform3DIdentity
        }
        isMenu = !isMenu
    }
    override func viewDidAppear(_ animated: Bool) {
        //self.navigationController?.navigationBar.frame.origin.x = 100
        //self.navigationController?.title =
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 != 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.lblKH.text = arrChat[indexPath.row]
        return cell
        }else{
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! Cell2
        cell2.imgView.image = UIImage(named: arrChat[indexPath.row])
        return cell2
        }
    }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPlaylist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll", for: indexPath) as! collcell1
        //print(arrPlaylist[indexPath.row].listPlaylist)
        cell.listvideo = arrPlaylist[indexPath.row].listPlaylist
        cell.coll.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        let tranform  = CATransform3DTranslate(CATransform3DIdentity, 600, 0, 0)
        cell.layer.transform = tranform
        UIView.animate(withDuration: 3, animations: {
        cell.alpha = 1
        cell.layer.transform = CATransform3DIdentity
        })
    }
}
