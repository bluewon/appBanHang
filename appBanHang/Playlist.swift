//
//  Playlist.swift
//  appBanHang
//
//  Created by datnguyen on 12/27/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation

struct Playlist:BaseModel {
    var id: String
//    var idPlaylist:String
    var titPlaylist:String
    var titkhongdauPlaylist:String
    var listPlaylist:Array<Video> = []
    init() {
        id = ""
        titPlaylist = ""
        titkhongdauPlaylist = ""
        listPlaylist = []
    }
    init(object:Any) {
        if let dic:Dictionary<String,AnyObject> = object as? Dictionary<String,AnyObject>{
            if let list = dic["listVideos"] as? Array<AnyObject>{
                for i in list{
                    listPlaylist.append(Video(object: i))
                }
            }else{
                listPlaylist = []
            }
            if let id = dic["id"] as? String{
                self.id = id
            }else{
                self.id = ""
            }
            if let ten = dic["tit"] as? String{
                titPlaylist = ten
            }else{
                titPlaylist = ""
            }
            if let tenkd = dic["tit_khongdau"] as? String{
                titkhongdauPlaylist = tenkd
            }else{
                titkhongdauPlaylist = ""
            }

        }else{
            id = ""
            titPlaylist = ""
            titkhongdauPlaylist = ""
            listPlaylist = []
            
        }
    }
}
