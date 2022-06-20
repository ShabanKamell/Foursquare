//
// Created by Shaban on 19/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import CoreLocation

public typealias LocationConsumerClosure = (CLLocation) -> Void

// TODO: Use a generic component for loading current location
public class CurrentLocationRetriever: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    private var onGetLocation: LocationConsumerClosure = { _ in
    }

    @Published var location: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }

    var latitude: CLLocationDegrees {
        location?.coordinate.latitude ?? 0
    }

    var longitude: CLLocationDegrees {
        location?.coordinate.longitude ?? 0
    }

    public init(onGetLocation: @escaping LocationConsumerClosure) {
        self.onGetLocation = onGetLocation
        super.init()
    }

    public func start() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension CurrentLocationRetriever: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        locationManager.stopUpdatingLocation()
        self.location = location
        onGetLocation(location)
    }
}

