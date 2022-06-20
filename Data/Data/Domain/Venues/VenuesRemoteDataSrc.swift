//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

public protocol VenuesRemoteDataSrcContract {
    func loadVenues(location: CLLocation) async throws -> [VenueResponse]
}

public struct VenuesRemoteDataSrc: VenuesRemoteDataSrcContract {
    let api: VenuesApiProvider

    public init(api: VenuesApiProvider) {
        self.api = api
    }

    public func loadVenues(location: CLLocation) async throws -> [VenueResponse] {
        let response: VenuesResponse = try await api.request(api: .venues(location))
        return response.results
    }

}
