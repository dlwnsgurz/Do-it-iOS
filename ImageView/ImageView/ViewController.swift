//
//  ViewController.swift
//  ImageView
//
//  Created by LEE on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var resizeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on")
        imgOff = UIImage(named: "lamp_off")
        
        imgView.image = imgOn
    }
    @IBAction func touchUpResizeButton(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight: CGFloat
        if isZoom {
            resizeButton.setTitle("확대", for: .normal)
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }else{
            resizeButton.setTitle("축소", for: .normal)
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
        }
        isZoom.toggle()
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    @IBAction func switchOnOffButton(_ sender: UISwitch){
        if sender.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
}
