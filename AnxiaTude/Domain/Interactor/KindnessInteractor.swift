//
//  KindnessInteractor.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation
import Combine

class KindnessInteractor: QuoteUseCase {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchQuote(for category: Category) -> AnyPublisher<QuoteModel, Error> {
        remoteDataSource
            .fetchObject(for: category)
            .tryMap { (data: KindnessResponse) in
                return data.toQuote()
            }
            .eraseToAnyPublisher()
    }
}

