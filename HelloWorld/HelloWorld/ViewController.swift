//
//  ViewController.swift
//  HelloWorld
//
//  Created by LEE on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonSend(_ sender: UIButton) {
        helloLabel.text = "Hello! " + txtName.text!
    }
    
}

