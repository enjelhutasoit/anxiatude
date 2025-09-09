//
//  AnchorResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct AnchorResponse: Quoteable {
    let text: String
    let author: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: text, author: author)
    }
}
