//
//  MoreRootView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI

struct MoreRootView<C: MoreCoordinatorProtocol>: View {
    @StateObject var coordinator: C
    init(coordinator: C) {
        self._coordinator = .init(wrappedValue: coordinator)
    }
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.viewFor(.more)
                .navigationTitle(MoreRoutes.more.title)
                .navigationDestination(for: MoreRoutes.self) { route in
                    coordinator.viewFor(route)
                        .navigationTitle(route.title)
                        .toolbar(.hidden, for: .tabBar)
                }
        }
    }
}
