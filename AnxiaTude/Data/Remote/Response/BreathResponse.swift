//
//  BreathResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct BreathResponse: Quoteable {
    let q: String
    let a: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: q, author: a)
    }
}
