//
//  HomeViewModel.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Combine

final class HomeViewModel: HomeViewModelProtocol{

    @Published var venues: [VenueCardModel] = []
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var noInterNet: Bool = false
    @Published var errorMessage: String? = nil

    private var locationManager: any LocationManagerProtocol
    private var coordinator: any HomeCoordinatorProtocol
    private var cancellable: Set<AnyCancellable> = .init()

    init(coordinator: any HomeCoordinatorProtocol, locationManager: any LocationManagerProtocol) {
        self.locationManager = locationManager
        self.coordinator = coordinator
        self.bindLocation()
        self.bindNetworkStatus()
        self.bindLocationPermission()
        self.refresh()
    }

    func goToSettings() {
        coordinator.openSettings()
    }
    func refresh() {
        isLoading = true
        locationManager.getCurrentLocation()
    }
}

extension HomeViewModel{
    private func bindLocation(){
        locationManager.userLocationPublisher
            .compactMap({$0})
            .receive(on: DispatchQueue.main)
            .sink {[weak self] location in
                guard let self else {return}
                self.isLoading = false
                getVenues(location: location)
            }
            .store(in: &cancellable)
    }

    private func getVenues(location: LocationModel){
        isLoading = true
        let api: ApiRequest = .getVenuesApi(location: location)
        ApiClient
            .getDataFrom(api: api, as: NearByVenueModel.self)
            .compactMap({$0})
            .sink {[weak self] result in
                self?.isLoading = false
                if case let .failure(error) = result{
                    print(error.localizedDescription)
                    self?.showError(error.localizedDescription)
                }
            } receiveValue: {[weak self] response in
                self?.handleResponse(response)
            }.store(in: &cancellable)

    }
    private func handleResponse(_ response: NearByVenueModel){
        guard let meta = response.meta else { return }
        if meta.code == 200 {
            self.venues = response.response?.venues?.compactMap({VenueCardModel(from: $0)}) ?? []
        }else {
            if let errorDetail = meta.errorDetail{
                self.showError(errorDetail)
            }
        }

    }
    private func showError(_ error: String?){
        self.errorMessage = error
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.errorMessage = nil
        }
    }

    private func bindNetworkStatus(){
        NetworkMonitor.shared.$isConnected
            .compactMap({$0})
            .receive(on: DispatchQueue.main)
            .sink {[weak self] isConnected in
                if isConnected, self?.noInterNet == true { self?.refresh() }

                self?.noInterNet = !isConnected
            }.store(in: &cancellable)
    }
    private func bindLocationPermission(){
        locationManager.shouldOpenSettings.assign(to: &$showAlert)
    }
}
