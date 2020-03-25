//
//  MapViewController.swift
//  Get Me Out
//
//  Created by Salah  on 17/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapScreen: MKMapView!
    
    let locationManeger=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManeger.delegate=self
        locationService()
        addAnnotation(placeName: "Alexandria", lat: 31.21564, lon: 29.95527)
    }
    
    func setUpLocationManeger(){
        locationManeger.desiredAccuracy=kCLLocationAccuracyBest
    }
    
    func centerUserLocation(){
        if let location = locationManeger.location?.coordinate{
            let region=MKCoordinateRegion.init(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapScreen.setRegion(region, animated: true)
        }
    }
    
    func locationService(){
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManeger()
            checkLocationAutherization()
        }
        else{
            print("error")
        }
        
    }
    
    func checkLocationAutherization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapScreen.showsUserLocation=true
            centerUserLocation()
            locationManeger.startUpdatingLocation()
            break
        case .authorizedAlways:
            //
            break
        case .denied:
            //
            break
        case .notDetermined:
            locationManeger.requestAlwaysAuthorization()
            break
        case .restricted:
            //
            break
        @unknown default:
            fatalError()
        }
    }
    
    func addAnnotation(placeName:String,lat:CLLocationDegrees,lon:CLLocationDegrees){
        let placeAnnotation=MKPointAnnotation()
        placeAnnotation.title="\(placeName)"
        placeAnnotation.coordinate=CLLocationCoordinate2D(latitude: lat, longitude: lon)
        mapScreen.addAnnotation(placeAnnotation)
    }
}

extension MapViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{fatalError("error")}
        let center=CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region=MKCoordinateRegion.init(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapScreen.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutherization()
    }
    
    
}
