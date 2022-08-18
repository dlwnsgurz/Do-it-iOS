//
//  AddViewController.swift
//  TabelViewController
//
//  Created by LEE on 2022/08/18.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var textFieldAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        itemsImage.append("clock.png")
        textFieldAddItem.text = ""
        navigationController?.popViewController(animated: true)
    }
    
}
