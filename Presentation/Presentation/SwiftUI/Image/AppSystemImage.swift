//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import SwiftUI

public enum AppSystemImage: String {
    case chevronForward = "chevron.forward"
    case chevronBackward = "chevron.backward"
    case chevronDown = "chevron.down"
    case ellipsis = "ellipsis"
    case magnifyingGlass = "magnifyingglass"
    case checkmarkSquareFill = "checkmark.square.fill"
    case square = "square"
    case xMarkCircleFill = "xmark.circle.fill"
    case checkmarkCircleFill = "checkmark.circle.fill"
    case calendar = "calendar"
    case infoCircle = "info.circle"
    case infoCircleFill = "info.circle.fill"
    case info = "info"
    case arrowBackward = "arrow.backward"
    case arrowForward = "arrow.forward"
    case checkmarkSealFill = "checkmark.seal.fill"
    case locationCircleFill = "location.circle.fill"
}

public extension Image {
    init(systemName: AppSystemImage) {
        self.init(systemName: systemName.rawValue)
    }
}

