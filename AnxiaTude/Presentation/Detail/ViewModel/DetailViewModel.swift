//
//  DetailViewModel.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Combine
import Foundation

class DetailViewModel: ObservableObject, Identifiable {
    
    private var cancellables = Set<AnyCancellable>()
    private let useCase: QuoteUseCase
    let category: Category
    @Published var content: String = ""
    @Published var author: String = ""
    @Published var errorMessage: String = ""
    @Published var isError = false
    @Published var isLoading = false
    
    init(
        category: Category,
        useCase: QuoteUseCase
    ) {
        self.category = category
        self.useCase = useCase
    }
    
    func fetchQuote() {
        isLoading = true
        
        useCase
            .fetchQuote(for: category)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                    self?.isError = true
                case .finished:
                    self?.isLoading = false
                    self?.isError = false
                }
            } receiveValue: { [weak self] quote in
                self?.content = quote.content
                self?.author = quote.author
            }
            .store(in: &cancellables)
    }
}
