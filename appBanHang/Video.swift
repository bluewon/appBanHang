//
//  Video.swift
//  appBanHang
//
//  Created by datnguyen on 12/27/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation

struct Video:BaseModel {
    var id: String
//    var idVideo:String
    var tenVideo:String
    var tenkhongdauVideo:String
    var linkVideo:String
    init() {
        id = ""
        tenVideo = ""
        tenkhongdauVideo = ""
        linkVideo = ""
    }
    init(object:Any) {
        if let dic = object as? Dictionary<String,AnyObject>{
            if let id = dic["idVideo"] as? String{
                self.id = id
            }else{
                self.id = ""
            }
            if let ten = dic["ten"] as? String{
                tenVideo = ten
            }else{
                tenVideo = ""
            }
            if let tenkd = dic["ten_khongdau"] as? String{
                tenkhongdauVideo = tenkd
            }else{
                tenkhongdauVideo = ""
            }
            if let link = dic["linkHinh"] as? String{
                linkVideo = link
            }else{
                linkVideo = ""
            }
        }else{
            id = ""
            tenVideo = ""
            tenkhongdauVideo = ""
            linkVideo = ""
        }
    }
}
