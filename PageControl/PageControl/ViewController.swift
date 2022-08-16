//
//  ViewController.swift
//  PageControl
//
//  Created by LEE on 2022/08/16.
//

import UIKit

class ViewController: UIViewController{

    
    let imageNameList = ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png"]
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imageNameList[0])
        pageControl.currentPage = 0
        pageControl.numberOfPages = imageNameList.count
        pageControl.currentPageIndicatorTintColor = .green
        pageControl.pageIndicatorTintColor = .red
    }
    
    
    @IBAction func changePage(_ sender: UIPageControl) {
        imageView.image = UIImage(named: imageNameList[pageControl.currentPage])
    }
    
}

