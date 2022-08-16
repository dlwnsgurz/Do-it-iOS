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
        locationsManager.delegate = self // delegate 프로토콜을 채택
        locationsManager.desiredAccuracy = kCLLocationAccuracyBest // 정보 정확도 최고로.
        locationsManager.requestWhenInUseAuthorization() // 사용자에게 위치 정보를 넘겨줄 것인지 묻는다.
        locationsManager.startUpdatingLocation() // 사용자의 정보를 받아온다.
        mapView.showsUserLocation = true // 유저의 위치를 파란색으로 표시한다.
    }

    // 인자로 넘겨준 위도와 경도 줌 비율에 따라 지도에 표시한다.
    func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    // delegate에 선언되어 있는 것으로써, 위치 정보가 업데이트 된 뒤 호출된다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longtitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { // 현재 위치의 정보를 받아온다.
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
        locationsManager.stopUpdatingLocation() // 위치 정보 업데이트를 끝내는 함수로써 호출해야 이 큰 함수를 탈출할 수 있다.
    }
    func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtitudeValue: longtitudeValue, delta: span)
        // 위도와 경도로 전달된 위치에 표시한다.
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

