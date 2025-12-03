//
//  HomeViewModelProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject{
    var venues: [VenueCardModel] { get }
    var showAlert: Bool { get set }
    var isLoading: Bool { get }
    var noInterNet: Bool { get }
    var errorMessage: String? { get }
    
    func goToSettings()
    func refresh()
}
