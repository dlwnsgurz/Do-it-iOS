//
//  ViewController.swift
//  DoItPractice
//
//  Created by LEE on 2022/08/14.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
        loadPage("www.naver.com")
    }
    
    // - 사용자 정의 메소드
    func loadPage(_ sender: String)
    {
        let tmpSiteUrl: String = checkUrl(sender)
        let url = URL(string: tmpSiteUrl)
        let requestUrl = URLRequest(url: url!)
        webView.load(requestUrl)
    }
    
    func checkUrl(_ sender: String) -> String
    {
        if(sender.hasPrefix("http://")){
            return sender
        }else{
            return  "http://" + sender
        }
    }
    
    @IBAction func touchUpGoButton(_ sender: UIButton) {
        let userUrl : String = textField.text!
        loadPage(userUrl)
    }
    // - 상단 바 메소드
    @IBAction func touchUpSite1Button(_ sender: UIButton) {
        loadPage("op.gg")
    }
    @IBAction func touchUpSite2Button(_ sender: UIButton) {
        loadPage("fow.kr")
    }
    @IBAction func touchUpHtmlButton(_ sender: UIButton) {
        let htmlString = "<html> <h1> HTML STRING </h1> </html>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func touchUpFileButton(_ sender: UIButton) {
        let htmlFile = Bundle.main.path(forResource: "htmlFile", ofType: "html")
        let url = URL(fileURLWithPath: htmlFile!)
        let requestUrl = URLRequest(url: url)
        webView.load(requestUrl)
    }
    
    // - 툴 바 버튼 메소드
    @IBAction func touchUpStopButton(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func touchUpRewindButton(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func touchUpFastFowardButton(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    // - Delegate 메소드
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        activityIndicator.isHidden = false
        activityIndicator.stopAnimating()
    }
}

