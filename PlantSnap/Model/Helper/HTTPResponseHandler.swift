//
//  HTTPResponseHandler.swift
//  PlantSnap
//
//  Created by M Yashlan on 13/02/24.
//

import Foundation

enum HTTPResponseHandler {
    case success(Data)
    case rateLimitExceeded(Int)
    case unexpectedResponse(Int)
    case error(Error)
    
    init(response: URLResponse?, data: Data?, error: Error?) {
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200:
                if let data = data {
                    self = .success(data)
                } else {
                    self = .error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Empty response data"]))
                }
            case 429:
                if let remainingAttempts = httpResponse.allHeaderFields["X-RateLimit-Remaining"] as? Int {
                    if remainingAttempts > 0 {
                        self = .rateLimitExceeded(remainingAttempts)
                    } else {
                        self = .error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Rate limit exceeded. No remaining attempts. Retry after some time."]))
                    }
                } else {
                    self = .error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Rate limit exceeded. Retry after some time."]))
                }
            default:
                self = .unexpectedResponse(httpResponse.statusCode)
            }
        } else if let error = error {
            self = .error(error)
        } else {
            self = .error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
        }
    }
}
