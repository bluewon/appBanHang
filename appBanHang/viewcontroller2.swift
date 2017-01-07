//
//  viewcontroller2.swift
//  appBanHang
//
//  Created by datnguyen on 12/15/16.
//  Copyright © 2016 datnguyen. All rights reserved.
//

import Foundation
import UIKit

class view2:UIViewController {
    let webView:UIWebView = {
        let wb = UIWebView()
        wb.scrollView.isScrollEnabled = false
        wb.translatesAutoresizingMaskIntoConstraints = false
        return wb
    }()
    var video:Video = Video()
    var link:String{
        return "https://www.youtube.com/embed/\(video.id)"
    }
    override func viewDidLoad() {
        view.addSubview(webView)
        view.addContrainsWithVS(format: "H:|[v0]|", views: webView)
        view.addContrainsWithVS(format: "V:|[v0]|", views: webView)
        let url:URL = URL(string: link)!
        let request:URLRequest = URLRequest(url: url)
        webView.loadRequest(request)
        view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    }
}
