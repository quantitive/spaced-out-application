//
//  LocationManager.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/30/22.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager  = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        completion?(location)
        manager.stopUpdatingLocation()
        
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        
        print("longitude: = \(longitude), latitude = \(latitude)")
    }
}