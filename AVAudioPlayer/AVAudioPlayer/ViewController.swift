//
//  ViewController.swift
//  AVAudioPlayer
//
//  Created by LEE on 2022/08/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate{

    var audioPlayer: AVAudioPlayer!
    var maxVolume : Float = 10.0
    var audioUrl: URL!
    var progressTimer: Timer!
    var recordMode: Bool = false
    var recordPlayer: AVAudioRecorder!
    
    let audioTimeSelector: Selector = #selector(Self.updateTime)
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var endTimeLabel: UILabel!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var recordTime: UILabel!
    @IBOutlet var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAudioFile()
        if !recordMode{
            initPlay()
            recordButton.isEnabled = false
            recordTime.isEnabled = false
        }else{
            initRecord()
        }
        
    }
    func selectAudioFile(){
        if !recordMode{
            audioUrl = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioUrl = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        }catch let error as NSError{
            print("error : \(error)")
        }
        
        volumeSlider.maximumValue = maxVolume
        volumeSlider.value = 1.0
        progressView.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volumeSlider.value
        
        currentTimeLabel.text = "00:00"
        endTimeLabel.text = convertTimeInterval2String(time: audioPlayer.duration)
        
        setButtonsIsEnabled(play: true, pause: false, stop: false)
    }
    func initRecord(){
        let recordSetting = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
        AVSampleRateKey: 44100.0] as [String: Any]
        
        do{
            recordPlayer = try AVAudioRecorder(url: audioUrl, settings: recordSetting)
        }catch let error as NSError{
            print("error : \(error)")
        }
        
        recordPlayer.delegate = self
        volumeSlider.maximumValue = maxVolume
        volumeSlider.value = 1.0
        currentTimeLabel.text = "00:00"
        endTimeLabel.text = convertTimeInterval2String(time: audioPlayer.duration)
        
        setButtonsIsEnabled(play: true, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError{
            print("error : \(error)")
        }
        do{
            try session.setActive(true)
        }catch let error as NSError{
            print("error : \(error)")
        }
    }
    func convertTimeInterval2String(time: TimeInterval)-> String{
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let string = String(format: "%02d:%02d", min,sec)
        return string
    }
    
    func setButtonsIsEnabled(play: Bool, pause: Bool, stop: Bool){
        playButton.isEnabled = play
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
    
    @objc func updateTime(){
        currentTimeLabel.text = convertTimeInterval2String(time: audioPlayer.currentTime)
        progressView.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    
    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        audioPlayer.play()
        setButtonsIsEnabled(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: audioTimeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func touchUpPauseButton(_ sender: UIButton) {
        audioPlayer.pause()
        setButtonsIsEnabled(play: true, pause: false, stop: true)
    }
    @IBAction func touchUpStopButton(_ sender: UIButton) {
        audioPlayer.stop()
        setButtonsIsEnabled(play: true, pause: false, stop: false)
        progressView.progress = 0
        progressTimer.invalidate()
        currentTimeLabel.text = "00:00"
        endTimeLabel.text = convertTimeInterval2String(time: audioPlayer.duration)
    }
    @IBAction func changeVolumeSlider(_ sender: UISlider) {
        audioPlayer.volume = volumeSlider.value
    }
    
    @IBAction func touchUpRecordButton(_ sender: UIButton) {
        
    }
    
    @IBAction func changeRecordSwtich(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            recordTime.text = "00:00"
            recordMode = true
            recordButton.isEnabled = true
            recordTime.isEnabled = true
        }else{
            recordPlayer.stop()
            recordButton.isEnabled = false
            recordTime.isEnabled = false
            recordTime.text = "00:00"
        }
        selectAudioFile()
        if !recordMode{
            initPlay()
        }else{
            initRecord()
        }
    }
    
}

