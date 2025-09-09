//
//  FaithInteractor.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine

class FaithInteractor: QuoteUseCase {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchQuote(for category: Category) -> AnyPublisher<QuoteModel, Error> {
        remoteDataSource
            .fetchText(for: category)
            .tryMap { response in
                let quote = FaithResponse(text: response)
                return quote.toQuote()
            }
            .eraseToAnyPublisher()            .eraseToAnyPublisher()
    }
}
