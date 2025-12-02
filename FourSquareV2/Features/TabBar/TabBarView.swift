//
//  TabBarView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import SwiftUI

struct TabBarView<C: TabBarCoordinatorProtocol>: View {
    @StateObject var coordinator: C
    init(coordinator: C) {
        self._coordinator = .init(wrappedValue: coordinator)
    }
    var body: some View {
        TabView(selection: $coordinator.selectedTap) {
            ForEach(coordinator.tabs) { tab in
                coordinator.viewFor(tab)
                    .tabItem {
                        VStack{
                            Image(systemName: tab.imageName)
                                .resizable()
                                .renderingMode(.template)
                            Text(tab.title)
                        }
                    }
            }
        }
    }
}
