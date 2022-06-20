import Foundation

public protocol DataManagerContract {
    var venuesRepo: VenuesRepo { get }

}

public struct DataManager: DataManagerContract {
    public static let shared = DataManager()
    public var venuesRepo: VenuesRepo = .shared

    public static func build() -> DataManagerContract {
        DataManager.shared
    }

}
