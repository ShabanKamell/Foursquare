//
// Created by Shaban Kamel on 07/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

class HomeVM: AppViewModel {
    public var dataManager: DataManagerContract
    @Published public var loadState: LoadingState = .init()
    public var requester: AsyncMan
    lazy var currentLocationRetriever: CurrentLocationRetriever = CurrentLocationRetriever { location in
        self.loadVenues(location: location)
    }
    @Published public var venues: [VenueItem] = []

    public init(dataManager: DataManagerContract, requester: AsyncMan) {
        self.dataManager = dataManager
        self.requester = requester
    }

    func loadVenues(location: CLLocation) {
        request(checkConnectivity: false) {
            let networkState = await NetworkConnectivity.state()
            let response = try await self.dataManager
                    .venuesRepo
                    .loadVenues(location: location, networkState: networkState)
            self.venues = response.map {
                VenueItem(
                        id: $0.fsqID,
                        name: $0.name)
            }
        }
    }

}