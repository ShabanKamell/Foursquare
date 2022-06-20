//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

public typealias VenuesApiProvider = ApiProvider<VenuesApi>

public enum VenuesApi {
    case venues(CLLocation)
}

extension VenuesApi: ApiTargetType {

    public var path: String {
        switch self {
        case let .venues(location):
            return "nearby?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .venues:
            return .get
        }
    }

    public var task: ApiTask {
        switch self {
        case .venues:
            return .requestPlain
        }
    }
}
