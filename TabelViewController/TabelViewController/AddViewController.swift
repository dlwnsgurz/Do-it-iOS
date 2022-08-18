//
//  AddViewController.swift
//  TabelViewController
//
//  Created by LEE on 2022/08/18.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let pickerViewImage = ["cart.png", "clock.png", "pencil.png"]
    var pickerViewSelectedImage :String = ""
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var textFieldAddItem: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        imageView.image = UIImage(named: pickerViewImage[0])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func touchUpAddButton(_ sender: UIButton) {
        items.append(textFieldAddItem.text!)
        itemsImage.append(pickerViewSelectedImage)
        textFieldAddItem.text = ""
        navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewImage.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let uiImageView = UIImageView(image: UIImage(named: pickerViewImage[row]))
        uiImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 25)
        return uiImageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedImage = UIImage(named: pickerViewImage[row])
        pickerViewSelectedImage = pickerViewImage[row]
        imageView.image = selectedImage
    }
    
    
    
}
