//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Shen Xiaochun on 2017/3/24.
//  Copyright © 2017年 Sigutian. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    
    var webView : WKWebView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        let myURL = URL(string: "https://www.bignerdranch.com")
        
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view = webView
        
    }

    
}
