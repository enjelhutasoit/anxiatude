//
//  AffirmInteractor.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine

class AffirmInteractor: QuoteUseCase {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchQuote(for category: Category) -> AnyPublisher<QuoteModel, Error> {
        remoteDataSource
            .fetchObject(for: category)
            .tryMap { (data: AffirmResponse) in
                data.toQuote()
            }
            .eraseToAnyPublisher()
    }
}
