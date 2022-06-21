//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public protocol ApiTargetType {
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The type of HTTP task to be performed.
    var task: ApiTask { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

public extension ApiTargetType {
     var baseURL: URL {
        URL(string: "https://api.foursquare.com/v3/places/")!
    }

     var headers: [String: String]? {
        [
            "Accept": "application/json",
            "Authorization": FoursquareToken.token
        ]
    }

    var parameters: [String: Any]? {
        nil
    }
}