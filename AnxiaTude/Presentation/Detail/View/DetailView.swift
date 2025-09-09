//
//  DetailView.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct DetailScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isError {
                Text(viewModel.errorMessage)
            } else if viewModel.isLoading {
                LoadingView()
            } else {
                VStack(alignment: .leading, spacing: 16) {
                    Spacer()
                    Text(viewModel.content)
                        .font(.title)
                    
                    Text("\u{2014} \(viewModel.author)")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 24)
        .onAppear {
            viewModel.fetchQuote()
        }
        .toolbarBackground(.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationTitle(viewModel.category.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackArrowButton { dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    TnCView()
                } label: {
                    Image(systemName: "doc.text")
                        .foregroundStyle(AppColors.primaryColor)
                }
            }
        }
    }
}
