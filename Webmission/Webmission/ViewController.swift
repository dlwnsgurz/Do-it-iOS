//
//  ViewController.swift
//  Webmission
//
//  Created by LEE on 2022/08/13.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        let htmlFile = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: htmlFile!)
        let myRequest = URLRequest(url: myUrl)
        webView.load(myRequest)
    }
    

}

