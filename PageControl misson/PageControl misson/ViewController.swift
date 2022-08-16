//
//  ViewController.swift
//  PageControl misson
//
//  Created by LEE on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    let numberList = [1,2,3,4,5,6,7,8,9,10]
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberLabel.font = .systemFont(ofSize: 100, weight: .bold)
        numberLabel.textAlignment = .center
        pageControl.numberOfPages = numberList.count
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .gray
        numberLabel.text = String(numberList[0])
    }
    
    @IBAction func changePageControl(_ sender: UIPageControl) {
        numberLabel.text = String(numberList[pageControl.currentPage])
    }
    
}

