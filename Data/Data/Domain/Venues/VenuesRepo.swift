//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

public struct VenuesRepo {
    public static let shared = VenuesRepo.build()
    private let remoteSrc: VenuesRemoteDataSrc
    private let localSrc: VenuesLocalDataSrc

    public func loadVenues(
            location: CLLocation,
            networkState: NetworkConnectivity.State) async throws -> [Venue] {
        switch networkState {
        case .satisfied:
            return try await remoteSrc.loadVenues(location: location)
        case .unsatisfied:
            return try await localSrc.loadVenues(location: location)
        }
    }

}

public extension VenuesRepo {

    static func build() -> VenuesRepo {
        VenuesRepo(
                remoteSrc: VenuesRemoteDataSrc(api: VenuesApiProvider()),
                localSrc: VenuesLocalDataSrc())
    }
}
