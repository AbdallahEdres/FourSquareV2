//
//  FourSquareV2App.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import SwiftUI

@main
struct FourSquareV2App: App {
    let tabBarCoordinator: any TabBarCoordinatorProtocol
    init() {
        self.tabBarCoordinator = TabBarCoordinator()
    }
    var body: some Scene {
        WindowGroup {
            tabBarCoordinator.start()
        }
    }
}
