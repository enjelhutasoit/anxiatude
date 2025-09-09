//
//  ResetResponse.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

struct ResetResponse: Quoteable {
    let activity: String
    
    func toQuote() -> QuoteModel {
        return QuoteModel(content: activity, author: "💡")
    }
}
