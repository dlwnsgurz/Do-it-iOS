//
//  EditViewController.swift
//  NavigationController
//
//  Created by LEE on 2022/08/16.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didLampSetDone( isLampOn: Bool)
    func didLampZoomDone( isZoom: Bool)
}

class EditViewController: UIViewController{

    var textOfLabel: String = ""
    var textOfField: String = ""
    var delegate : EditDelegate?
    var isLampOn = false
    var isZoom = false
    
    @IBOutlet var lampSwitch: UISwitch!
    @IBOutlet var lampImageView: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var resizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = textOfLabel
        textField.text = textOfField
        if isLampOn{
            lampImageView.image = UIImage(named: "lamp_on")
        }else{
            lampImageView.image = UIImage(named: "lamp_off")
        }
        let scale : CGFloat = 2.0
        let imageWidth: CGFloat = lampImageView.frame.width
        let imageHeight: CGFloat = lampImageView.frame.height
        if isZoom{
            lampImageView?.frame.size = CGSize(width: imageWidth * scale, height: imageHeight * scale)
            resizeButton.setTitle("축소", for: .normal)
        }else{
            lampImageView?.frame.size = CGSize(width: imageWidth / scale, height: imageHeight / scale)
            resizeButton.setTitle("확대", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpZoomButton(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        let imageWidth: CGFloat = lampImageView.frame.width
        let imageHeight: CGFloat = lampImageView.frame.height
        if isZoom{
            lampImageView?.frame.size = CGSize(width: imageWidth * scale, height: imageHeight * scale)
            resizeButton.setTitle("축소", for: .normal)
            isZoom = false
        }else{
            lampImageView?.frame.size = CGSize(width: imageWidth / scale, height: imageHeight / scale)
            resizeButton.setTitle("확대", for: .normal)
            isZoom = true
        }
    }
    @IBAction func touchUpDoneButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: textField.text!)
            delegate?.didLampSetDone(isLampOn: lampSwitch.isOn)
        }
    }
    
    @IBAction func switchLamp(_ sender: UISwitch) {
        if lampSwitch.isOn{
            lampImageView.image = UIImage(named: "lamp_on")
        }else{
            lampImageView.image = UIImage(named: "lamp_off")
        }
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
