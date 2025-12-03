//
//  MoreCoordinatorProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
import SwiftUI

protocol MoreCoordinatorProtocol: ObservableObject{
    var path: NavigationPath { get set }

    func start() -> AnyView
    func viewFor(_ route: MoreRoutes) -> AnyView
}

