//
//  AppColors.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct AppColors {
    static let primaryColor = Color(hex: "#F4AFA6")
    static let breathColor = Color(hex: "#A3D5D3")
    static let anchorColor = Color(hex: "#81C784")
    static let kindnessColor = Color(hex: "#F4A9BB")
    static let faithColor = Color(hex: "#ADC2EB")
    static let resetColor = Color(hex: "#D6E200")
    static let affirmColor = Color(hex: "#FFD972")
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
