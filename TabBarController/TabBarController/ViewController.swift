//
//  ViewController.swift
//  TabBarController
//
//  Created by LEE on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpDatepickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
    @IBAction func touchUpImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func touchUpPickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

