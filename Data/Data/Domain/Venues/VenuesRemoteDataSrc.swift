//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

struct VenuesRemoteDataSrc {
    let api: VenuesApiProvider

    init(api: VenuesApiProvider) {
        self.api = api
    }

    func loadVenues(location: CLLocation) async throws -> [Venue] {
        let response: VenuesResponse = try await api.request(api: .venues(location))
        return response.results
    }

}
