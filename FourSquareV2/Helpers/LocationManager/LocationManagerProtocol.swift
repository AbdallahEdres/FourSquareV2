//
//  LocationManagerProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Combine

protocol LocationManagerProtocol{
    var userLocationPublisher: CurrentValueSubject<LocationModel?, Never> { get }
    var shouldOpenSettings: CurrentValueSubject<Bool, Never> { get }

    func getCurrentLocation()
}
