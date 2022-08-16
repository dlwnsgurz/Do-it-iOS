//
//  ViewController.swift
//  PickerView
//
//  Created by LEE on 2022/08/09.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_ROW_NUMBER = 6
    let CUR_NUMBER = 1
    var uiImageList :[UIImage?] = []
    var imageList = ["1.png", "2.png", "3.png" , "4.png", "5.png", "6.png"]
    
    @IBOutlet var selectedItemLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<MAX_ROW_NUMBER
        {
            let tempImage = UIImage(named: imageList[i])
            uiImageList.append(tempImage)
        }
        imageView.image = uiImageList[0]
        selectedItemLabel.text = imageList[0]
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return CUR_NUMBER + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return MAX_ROW_NUMBER
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let imageView = UIImageView(image: uiImageList[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if(component == 0){
            selectedItemLabel.text = imageList[row]
        }else{
            imageView.image = uiImageList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return CGFloat(80)
    }
    
    
}
