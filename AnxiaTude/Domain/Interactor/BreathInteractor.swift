//
//  BreathInteractor.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine
import Foundation

class BreathInteractor: QuoteUseCase {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchQuote(for category: Category) -> AnyPublisher<QuoteModel, Error> {
        remoteDataSource
            .fetchArray(for: category)
            .tryMap { (response: [BreathResponse]) -> QuoteModel in
                guard let firstQuote = response.first else {
                    throw URLError(URLError.unknown)
                }
                return firstQuote.toQuote()
            }
            .eraseToAnyPublisher()
    }
}
