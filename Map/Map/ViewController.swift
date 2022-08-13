//
//  ViewController.swift
//  Map
//
//  Created by LEE on 2022/08/13.
//

import UIKit
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var locationLabel1: UILabel!
    @IBOutlet var locationLabel2: UILabel!
    
    let locationsManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationLabel1.text = ""
        locationLabel2.text = ""
        locationsManager.delegate = self
        locationsManager.desiredAccuracy = kCLLocationAccuracyBest
        locationsManager.requestWhenInUseAuthorization()
        locationsManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }

    func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longtitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address : String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.locationLabel1.text = "현재 위치"
            self.locationLabel2.text = address
            }
            
        )
        locationsManager.stopUpdatingLocation()
    }
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtitudeValue: longtitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        mapView.addAnnotation(annotation)
        
    }
    @IBAction func changeSeg(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            locationLabel1.text = ""
            locationLabel2.text = ""
            locationsManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.751853, longtitudeValue: 128.87605740000004, delta: 0.01, title: "한국폴리텍대학 강릉 캠퍼스", subtitle: "강원도 강릉시 남산 초교길 121")
            locationLabel1.text = "보고 계신 위치"
            locationLabel2.text = "한국폴리텍 대학 강릉캠퍼스"

        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.556876, longtitudeValue: 126.914046, delta: 0.01, title: "이지퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            locationLabel1.text = "보고 계신 위치"
            locationLabel2.text = "이지스 퍼블리싱 출판사"
        }else{
            setAnnotation(latitudeValue: 37.5, longtitudeValue: 37.5, delta: 0.01, title: "관악롯데타워", subtitle: "서울시 동작구 신대방동 롯데타워")
            locationLabel1.text = "보고 계신 위치"
            locationLabel2.text = "내 집"
        }
    
    }
    
}

