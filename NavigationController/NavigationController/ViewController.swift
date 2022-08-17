//
//  ViewController.swift
//  NavigationController
//
//  Created by LEE on 2022/08/16.
//

import UIKit

class ViewController: UIViewController, EditDelegate{
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var lampImageView: UIImageView!
    
    let lampOnImage = UIImage(named: "lamp_on")
    let lampOffImage = UIImage(named: "lamp_off")
    var isLampOn = true
    var isZoom = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImageView.image = lampOnImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "barEditButton"{
            editViewController.textOfLabel = "bar Edit Button"
        }else if segue.identifier == "editButton"{
            editViewController.textOfLabel = "edit Button"
        }
        editViewController.textOfField = textField.text!
        editViewController.isLampOn = self.isLampOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
        let imageWidth: CGFloat = lampImageView.frame.width
        let imageHeight: CGFloat = lampImageView.frame.height
        editViewController.size = CGSize(width: imageWidth, height: imageHeight)
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textField.text = message
    }
    
    func didLampSetDone(isLampOn: Bool) {
        if isLampOn {
            lampImageView.image = lampOnImage
        }else{
            lampImageView.image = lampOffImage
        }
    }
    func didLampZoomDone(isZoom: Bool) {
        let scale : CGFloat = 2.0
        let imageWidth: CGFloat = lampImageView.frame.width
        let imageHeight: CGFloat = lampImageView.frame.height
        
        if isZoom{
            lampImageView?.frame.size = CGSize(width: imageWidth, height: imageHeight)
            self.isZoom = true
        }else{
            lampImageView?.frame.size = CGSize(width: imageWidth / scale, height: imageHeight / scale)
            self.isZoom = false
        }
    }
}

