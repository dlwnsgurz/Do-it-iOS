//
//  ViewController.swift
//  DatePicker
//
//  Created by LEE on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String = ""
    
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var datePickerLabel: UILabel!
    @IBOutlet var datePickerView: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        datePickerLabel.text = "선택시간 : " + formatter.string(from: sender.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        currentTimeLabel.text = "현재시각 : " + formatter.string(from: date as Date)
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if(currentTime == alarmTime)
        {
            let alert = UIAlertController(title: "알림", message: "설정하신 시간입니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "네, 알겠습니다.", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            view.backgroundColor = .white
        }
    }
}

