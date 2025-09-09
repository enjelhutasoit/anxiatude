//
//  AffirmResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct AffirmResponse: Quoteable {
    let affirmation: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: affirmation, author: "🌱")
    }
}
