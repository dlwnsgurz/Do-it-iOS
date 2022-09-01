//
//  AddViewController.swift
//  DoItiOSPractice
//
//  Created by LEE on 2022/08/29.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        toDoArray.append(textField.text!)
        imageListArray.append(imageListArray[0])
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
