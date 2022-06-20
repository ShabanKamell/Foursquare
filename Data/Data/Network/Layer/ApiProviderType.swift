//
// Created by Shaban on 20/06/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

/// A protocol representing a minimal interface for a MoyaProvider.
/// Used by the reactive provider extensions.
public protocol ApiProviderType: AnyObject {

    associatedtype Target: ApiTargetType

    func request<T: Decodable>(api: Target) async throws -> T
}

/// Request provider class. Requests should be made through this class only.
open class ApiProvider<Target: ApiTargetType>: ApiProviderType {

    public func request<T: Decodable>(api: Target) async throws -> T {
        switch api.task {
        case .requestPlain:
            return try await self.requestPlain(api: api)
        }
    }

    private func requestPlain<T: Decodable>(api: Target) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            let urlString = "\(api.baseURL.absoluteString)\(api.path)"

            let url = URL(string: urlString)!
            var request = URLRequest(
                    url: url,
                    cachePolicy: .useProtocolCachePolicy,
                    timeoutInterval: 10.0)
            request.httpMethod = api.method.rawValue
            request.allHTTPHeaderFields = api.headers

            let session = URLSession.shared
            let dataTask = session.dataTask(
                    with: request,
                    completionHandler: { (data, response, error) -> Void in
                        if let error = error {
                            print(error)
                            continuation.resume(throwing: error)
                            return
                        }
                        let decodedResponse = try! JSONDecoder().decode(T.self, from: data!)
                        continuation.resume(returning: decodedResponse)
                    })
            dataTask.resume()
        }
    }

}