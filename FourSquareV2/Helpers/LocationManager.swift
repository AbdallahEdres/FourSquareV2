//
//  LocationManager.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import CoreLocation
import Combine

/// this class handle the location permission and gets and publish the current location
///
final class LocationManager: NSObject, LocationManagerProtocol{
    var userLocationPublisher: CurrentValueSubject<LocationModel?, Never> = .init(nil)
    var shouldOpenSettings: CurrentValueSubject<Bool, Never> = .init(false)

    let manager: CLLocationManager

    override init() {
        self.manager = .init()
        super.init()
    }
    private func checkAuthorization() -> Bool{
        var isAuthorized = false
        switch manager.authorizationStatus {
        case .notDetermined, .restricted, .denied:
            isAuthorized = false

        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            isAuthorized = true
             
        default:
            isAuthorized = false
        }
        return isAuthorized
    }
    private func requestAuthorization(){
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            self.shouldOpenSettings.send(true)
        case .denied:
            self.shouldOpenSettings.send(true)
        default:
            break
        }
    }
    func getCurrentLocation(){
        if checkAuthorization(){
            manager.requestLocation()
        }else{
            requestAuthorization()
        }
    }
}


extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocationPublisher
            .send(.init(latitude: location.coordinate.latitude, longtude: location.coordinate.longitude))
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways,
                .authorizedWhenInUse,
                .authorized:
            getCurrentLocation()
        default:
            break
        }
    }
}
