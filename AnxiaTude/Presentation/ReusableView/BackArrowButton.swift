//
//  BackArrowButton.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct BackArrowButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(AppColors.primaryColor)
                .padding(.vertical, 6)
                .padding(.horizontal, 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(AppColors.primaryColor, lineWidth: 2.0)
                )
        }
    }
}
