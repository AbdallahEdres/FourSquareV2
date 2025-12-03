//
//  TermsViewModelProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
import Combine
protocol TermsViewModelProtocol: ObservableObject{
    var terms: String? { get }
}
