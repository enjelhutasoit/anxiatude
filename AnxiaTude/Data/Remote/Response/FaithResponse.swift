//
//  FaithResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct FaithResponse: Quoteable {
    let text: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: text, author: "Powered by OurManna.com")
    }
}
