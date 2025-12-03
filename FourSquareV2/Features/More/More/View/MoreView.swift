//
//  MoreView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI

struct MoreView<VM: MoreViewModelProtocol>: View {
    @StateObject var viewModel: VM
    init(viewModel:  VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                ForEach(viewModel.moreItems) { item in
                    moreRow(for: item)
                        .onTapGesture {
                            viewModel.didTab(item)
                        }
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 64)
        }
        .scrollIndicators(.hidden)
        .padding(0)
    }
    @ViewBuilder
    private func moreRow(for item: MoreItemModel) -> some View {
        HStack {
            Label(item.name, systemImage: item.image)
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 8)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Capsule().fill(Color.secondary.opacity(0.2)))
    }
}
