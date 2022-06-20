//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public struct VenueResponse: Codable {
    public let fsqID: String
    public let name: String

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case name = "name"
    }
}