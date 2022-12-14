//
//  ViewController.swift
//  ImageView
//
//  Created by LEE on 2022/08/08.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var resizeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on")
        imgOff = UIImage(named: "lamp_off")
        
        imageView.image = imgOn
    }
    @IBAction func touchUpResizeButton(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight: CGFloat
        if isZoom {
            resizeButton.setTitle("νλ", for: .normal)
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
        }else{
            resizeButton.setTitle("μΆμ", for: .normal)
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
        }
        isZoom.toggle()
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    @IBAction func switchOnOffButton(_ sender: UISwitch){
        if sender.isOn{
            imageView.image = imgOn
        }else{
            imageView.image = imgOff
        }
    }
}
