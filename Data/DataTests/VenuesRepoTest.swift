//
// Created by Shaban on 21/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import XCTest
@testable import Data

class VenueRepoTest: XCTestCase {

    func test_should_save_locally() async throws {
        let localSrc = FakeVenuesLocalDataSrc()
        let repo = VenuesRepo(
                remoteSrc: VenuesRemoteDataSrc(api: VenuesApiProvider()),
                localSrc: localSrc)
        try await repo.saveVenues([])
        XCTAssert(localSrc.isSaved)
    }

}

public class FakeVenuesLocalDataSrc: VenuesLocalDataSrcContract {
    var isSaved = false

    public func load() async throws -> [VenueResponse] {
        []
    }

    public func save(_ items: [VenueResponse]) async throws {
        isSaved = true
    }
}