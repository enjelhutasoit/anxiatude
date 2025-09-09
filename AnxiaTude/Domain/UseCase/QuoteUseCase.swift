//
//  QuoteUseCase.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine

protocol QuoteUseCase {
    func fetchQuote(for category: Category) -> AnyPublisher<QuoteModel, Error>
}
