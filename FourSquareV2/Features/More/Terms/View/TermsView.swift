//
//  TermsView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI

struct TermsView<VM: TermsViewModelProtocol>: View {
    @StateObject var viewModel: VM
    init(viewModel:  VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        Form{
            Text(viewModel.terms ?? "")
        }
    }
}
