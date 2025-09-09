//
//  LogoHeaderView.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct LogoHeaderView: View {
    var body: some View {
        Image("app-logo")
            .resizable()
            .scaledToFill()
            .frame(width: 216, height: 75)
    }
}
