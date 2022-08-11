//
//  ViewController.swift
//  Web
//
//  Created by LEE on 2022/08/11.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var textUrl: UITextField!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var webIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let requestUrl = URLRequest(url: myUrl!)
        webView.load(requestUrl)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        loadWebPage("https://www.naver.com")
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        webIndicator.startAnimating()
        webIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webIndicator.stopAnimating()
        webIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webIndicator.stopAnimating()
        webIndicator.isHidden = true
    }
    func checkUrl(_ url: String) -> String
    {
        let strUrl = url
        if strUrl.hasPrefix("http://"){
            return strUrl
        }else{
            return "http://" + strUrl
        }
    }
    @IBAction func touchUpGoButton(_ sender: UIButton) {
        let myUrl = checkUrl(textUrl.text!)
        loadWebPage(myUrl)
        textUrl.text = nil
    }
    @IBAction func touchUpCancelButton(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func touchUpResetButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func touchUpRewindButton(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func touchUpFastButton(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    @IBAction func touchUpSite1Button(_ sender: UIButton) {
        loadWebPage("https://ssu.ac.kr")
    }
    @IBAction func touchUpSite2Button(_ sender: UIButton) {
        loadWebPage("http://velog.io")
    }
    @IBAction func touchUpHtmlButton(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href = \"https://www.naver.com\"> 네이버 </a>로 이동</p>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func touchUpFileButton(_ sender: UIButton) {
        let htmlFile = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: htmlFile!)
        let myRequest = URLRequest(url: myUrl)
        webView.load(myRequest)
        
    }
}

