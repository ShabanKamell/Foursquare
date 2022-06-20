//
// Created by Shaban on 09/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Network


public class NetworkConnectivity {

    public enum State {
        case satisfied
        case unsatisfied
    }

    let monitor = NWPathMonitor()

    public static func state() async -> State {
        await isConnected() ? .satisfied : .unsatisfied
    }

    public static func isConnected() async -> Bool {
        await withCheckedContinuation { continuation in
            let monitor = NWPathMonitor()
            monitor.pathUpdateHandler = { path in
                switch path.status {
                case .satisfied:
                    continuation.resume(returning: true)
                case .unsatisfied,
                     .requiresConnection:
                    continuation.resume(returning: false)
                @unknown default:
                    continuation.resume(returning: false)
                }
                monitor.cancel()
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        }
    }

}
