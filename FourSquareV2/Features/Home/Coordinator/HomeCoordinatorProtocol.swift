//
//  HomeCoordinatorProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import SwiftUI

protocol HomeCoordinatorProtocol: ObservableObject{
    var path: NavigationPath { get set }

    func start() -> AnyView
    func viewFor(_ route: HomeRoutes) -> AnyView
    func openSettings()
}
