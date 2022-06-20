//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

public struct VenuesRepo {
    public static let shared = VenuesRepo.build()
    private let remoteSrc: VenuesRemoteDataSrcContract
    private let localSrc: VenuesLocalDataSrcContract

    public init(remoteSrc: VenuesRemoteDataSrcContract, localSrc: VenuesLocalDataSrcContract) {
        self.remoteSrc = remoteSrc
        self.localSrc = localSrc
    }

    public func loadVenues(
            location: CLLocation,
            networkState: NetworkConnectivity.State) async throws -> [VenueResponse] {
        switch networkState {
        case .satisfied:
            let items = try await remoteSrc.loadVenues(location: location)
            try await saveVenues(items)
            return items
        case .unsatisfied:
            return try await localSrc.load()
        }
    }

    func saveVenues(_ items: [VenueResponse]) async throws {
        try await localSrc.save(items)
    }

}

public extension VenuesRepo {

    static func build() -> VenuesRepo {
        VenuesRepo(
                remoteSrc: VenuesRemoteDataSrc(api: VenuesApiProvider()),
                localSrc: VenuesLocalDataSrc(dao: VenueDao()))
    }
}
