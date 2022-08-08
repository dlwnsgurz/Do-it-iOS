//
//  ViewController.swift
//  ImageViewMission
//
//  Created by LEE on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {

    var numImage = 1
    var maxImage = 6
    var isZoom = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var resizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: "1.png")
    }
    
    @IBAction func touchUpPreviousBtn(_ sender: UIButton) {
        if numImage <= 1{
            print("이전으로 돌아갈 수 없습니다.")
            return
        }else{
            numImage = numImage - 1
            let preImage: String = String(numImage) + ".png"
            imgView.image = UIImage(named: preImage)
        }
        
    }
        
    @IBAction func touchUpNextBtn(_ sender: UIButton) {
        if numImage >= maxImage{
            print("다음으로 갈 수 없습니다.")
            return
        }else{
            numImage = numImage + 1
            let nxtImage: String = String(numImage) + ".png"
            imgView.image = UIImage(named: nxtImage)
        }
    }
    @IBAction func touchUpRisizeButton(_ sender: UIButton) {
        
        let scale : CGFloat = 2.0
        var width : CGFloat
        var height : CGFloat
        
        if isZoom{
            resizeButton.setTitle("확대", for: .normal)
            width = imgView.frame.width / scale
            height = imgView.frame.height / scale
        }else{
            resizeButton.setTitle("축소", for: .normal)
            width = imgView.frame.width * scale
            height = imgView.frame.height * scale
        }
        isZoom.toggle()
        imgView.frame.size = CGSize(width: width, height: height)
    }
}

