//
//  ViewController.swift
//  Alert
//
//  Created by LEE on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {

    var isLampOn = false
    var isLampDeleted = false
    let lampOnImage = UIImage(named: "lamp-on.png")
    let lampOffImage = UIImage(named: "lamp-off.png")
    let lampDeletedImage = UIImage(named: "lamp-remove.png")
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = lampOffImage
    }

    @IBAction func touchUpOnButton(_ sender: UIButton) {
        if isLampOn {
            let alert = UIAlertController(title: "경고", message: "이미 전구가 켜져 있는 상태입니다.", preferredStyle:  .alert)
            let action = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            imageView.image = lampOnImage
            isLampOn = true
        }
    }
    
    @IBAction func touchUpOffButton(_ sender: UIButton) {
        if isLampOn && isLampDeleted == false{
            let alert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            let actionYes = UIAlertAction(title: "네", style: .default, handler: {
                ACTION in self.imageView.image = self.lampOffImage
                self.isLampOn = false
            })
            let actionNo = UIAlertAction(title: "아니오", style: .default, handler: nil)
                alert.addAction(actionYes)
                alert.addAction(actionNo)
                present(alert, animated: true, completion: nil)
            }
        }
    
    @IBAction func touchUpDeleteButton(_ sender: UIButton) {
        if !isLampDeleted{
            let alert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: .alert)
            let actionYes = UIAlertAction(title: "네", style: .destructive, handler: {ACTION in self.imageView.image = self.lampDeletedImage
                self.isLampDeleted = true
            })
            let actionOff = UIAlertAction(title: "아니오,끕니다", style: .default, handler: {ACTION in
                self.imageView.image = self.lampOffImage
                self.isLampOn = false
            })
            let actionOn = UIAlertAction(title: "아니오,킵니다", style: .default, handler: {ACTION in
                self.imageView.image = self.lampOnImage
                self.isLampOn = true
            })
            alert.addAction(actionOn)
            alert.addAction(actionOff)
            alert.addAction(actionYes)
            present(alert, animated: true, completion: nil)
        }

    }
}

