//
//  SecondViewController.swift
//  VirtualLibrary
//
//  Created by Rishi Jain on 02/06/19.
//  Copyright © 2019 Rishi Jain. All rights reserved.
//


import UIKit
import WebKit
var webView: WKWebView!

class SecondViewController: UIViewController , WKNavigationDelegate  {
    

    var dataa:String!
    var uorp:String!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if uorp == "url"
        {        let url = URL(string: dataa)!
            webView.load(URLRequest(url: url))
            
        }
        else
        {
            let url = URL(string: "https://drive.google.com/viewerng/viewer?embedded=true&url="+dataa)!
            webView.load(URLRequest(url: url))
            
            
        }
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        
        
        
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.backgroundColor = UIColor.black
        
        
    }
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
}
