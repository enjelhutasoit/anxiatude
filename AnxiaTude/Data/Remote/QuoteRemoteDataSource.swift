//
//  RemoteDataSource.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine
import Foundation

class RemoteDataSource {
    
    /// Custom SSL Pinning Delegate
    class SSLPinningDelegate: NSObject, URLSessionDelegate {
        func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            // Bypass SSL certificate validation by using the server trust directly
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        }
    }
    
    /// Custom URLSession with SSL pinning disabled (for development)
    private func createSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        let sslDelegate = SSLPinningDelegate()
        let session = URLSession(configuration: sessionConfiguration, delegate: sslDelegate, delegateQueue: nil)
        return session
    }
    
    func fetchObject<T: Decodable & Quoteable>(for category: Category) -> AnyPublisher<T, Error> {
        guard let url = URL(string: category.apiEndpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let session = createSession()
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchArray<T: Decodable>(for category: Category) -> AnyPublisher<T, Error> {
        guard let url = URL(string: category.apiEndpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let session = createSession()
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchText(for category: Category) -> AnyPublisher<String, Error> {
        guard let url = URL(string: category.apiEndpoint) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        let session = createSession()
        
        return session.dataTaskPublisher(for: url)
            .tryMap { data, response -> String in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                if let responseString = String(data: data, encoding: .utf8) {
                    return responseString
                } else {
                    throw URLError(.cannotParseResponse)
                }
            }
            .eraseToAnyPublisher()
    }
}
