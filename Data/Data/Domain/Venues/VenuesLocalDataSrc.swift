//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation
import UIKit
import Core

public protocol VenuesLocalDataSrcContract {
    func load() async throws -> [VenueResponse]
    func save(_ items: [VenueResponse]) async throws
}

public struct VenuesLocalDataSrc: VenuesLocalDataSrcContract {
    let dao: VenueDao

    public func load() async throws -> [VenueResponse] {
        try dao.all()
    }

    public func save(_ items: [VenueResponse]) async throws {
        try await dao.save(items)
    }
}
