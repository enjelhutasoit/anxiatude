//
//  QuoteResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct KindnessResponse: Quoteable {
    let content: String
    let author: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: content, author: author)
    }
}
