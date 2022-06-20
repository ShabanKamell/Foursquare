//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public struct VenuesResponse: Codable {
    public let results: [VenueResponse]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}