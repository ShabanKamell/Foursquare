//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation
import UIKit
import Core

struct VenuesLocalDataSrc {
    let dao: VenueDao

    func load() async throws -> [VenueResponse] {
        try dao.all()
    }

    func save(_ items: [VenueResponse]) async throws {
        try await dao.save(items)
    }
}
