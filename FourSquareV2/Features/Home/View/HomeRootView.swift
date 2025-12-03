//
//  HomeRootView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI

struct HomeRootView<C: HomeCoordinatorProtocol>: View {
    @StateObject var coordinator: C
    init(coordinator: C) {
        self._coordinator = .init(wrappedValue: coordinator)
    }
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.viewFor(.home)
                .navigationTitle(HomeRoutes.home.title)
                .navigationDestination(for: HomeRoutes.self) { route in
                    coordinator.viewFor(route)
                        .navigationTitle(route.title)
                }
        }
    }
}
