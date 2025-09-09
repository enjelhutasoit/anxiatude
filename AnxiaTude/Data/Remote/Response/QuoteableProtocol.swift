//
//  QuoteableProtocol.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import Foundation

protocol Quoteable: Decodable {
    func toQuote() -> QuoteModel
}
