//
//  HomeView.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI
import Combine
struct HomeView< VM: HomeViewModelProtocol>: View {
    @StateObject var viewModel: VM
    init(viewModel: VM) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    var body: some View {
        List {
            ForEach(viewModel.venues) { venue in
                buildRow(with: venue)
            }
        }
        .refreshable {
            viewModel.refresh()
        }
        .overlay {
            if viewModel.isLoading { ProgressView() }
            if let message = viewModel.errorMessage { buildErrorBanner(message: message) }
            if viewModel.noInterNet{ noInterNetView() }
        }
        .alert("Location Permission needed", isPresented: $viewModel.showAlert) {
            Button("open settings"){
                viewModel.goToSettings()
            }
        }
    }
}
extension HomeView{
    @ViewBuilder
    private func buildRow(with venue: VenueCardModel) -> some View{
        VStack(alignment: .leading) {
            Text(venue.name ?? "")
                .font(.headline)
            Text(venue.fullAddress ?? "")
                .font(.subheadline)
            HStack(spacing: 4){
                AsyncImage(url: URL(string: venue.categoryImageUrl ?? ""),content: { image in
                    image
                        .image?
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundStyle(Color.gray)

                })
                .frame(width: 24)

                Text(venue.categoryName ?? "")
                    .font(.caption)
            }

        }
        .padding(8)
    }

    @ViewBuilder
    private func buildErrorBanner(message: String) -> some View{
        VStack{
            Spacer()
            Text(message)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red)
                }
        }
        .padding()
    }

    @ViewBuilder
    private func noInterNetView() -> some View{
        VStack{
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("No internet connection")
        }
        .foregroundStyle(Color.gray.opacity(0.5))
    }
}
