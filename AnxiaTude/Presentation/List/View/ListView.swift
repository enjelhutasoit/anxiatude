//
//  ListView.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct ListView: View {
    
    let categories: [DetailViewModel] = [
        DetailViewModel(
            category: Category(
                name: "Breath",
                description: "Quotes to help you breathe and relax",
                color: AppColors.breathColor,
                apiEndpoint: "https://zenquotes.io/api/random"
            ),
            useCase: BreathInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
        DetailViewModel(
            category: Category(
                name: "Reset",
                description: "Quick activities to refresh your mind",
                color: AppColors.resetColor,
                apiEndpoint: "https://apis.scrimba.com/bored/api/activity?type=diy&type=relaxation"
            ),
            useCase: ResetInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
        DetailViewModel(
            category: Category(
                name: "Anchor",
                description: "Wisdom to ground your thoughts",
                color: AppColors.anchorColor,
                apiEndpoint: "https://stoic-quotes.com/api/quote"
            ),
            useCase: AnchorInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
        DetailViewModel(
            category: Category(
                name: "Kindness",
                description: "Inspiring quotes for compassion",
                color: AppColors.kindnessColor,
                apiEndpoint: "https://api.quotable.io/random?tags=inspirational|motivational|mindfulness|life"
            ),
            useCase: KindnessInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
        DetailViewModel(
            category: Category(
                name: "Faith",
                description: "Daily verses to strengthen your faith",
                color: AppColors.faithColor,
                apiEndpoint: "https://beta.ourmanna.com/api/v1/get"
            ),
            useCase: FaithInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
        DetailViewModel(
            category: Category(
                name: "Affirm",
                description: "Positive affirmations for confidence",
                color: AppColors.affirmColor,
                apiEndpoint: "https://www.affirmations.dev"
            ),
            useCase: AffirmInteractor(
                remoteDataSource: RemoteDataSource()
            )
        ),
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    LogoHeaderView()
                    setCategoriesView(with: proxy)
                }
            }
        }
    }
}

extension ListView {
    private func setCategoriesView(with proxy: GeometryProxy) -> some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                spacing: 16
            ) {
                ForEach(categories, id: \.id) { viewModel in
                    let itemWidth = max((proxy.size.width - 24) / 2, 0)
                    let itemHeight = max(itemWidth * 1.1, 0)
                    
                    NavigationLink {
                        DetailScreen(viewModel: viewModel)
                    } label: {
                        CategoryView(
                            title: viewModel.category.name,
                            description: viewModel.category.description,
                            width: itemWidth,
                            height: itemHeight,
                            color: viewModel.category.color
                        )
                    }
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 4)
        }
    }
}

struct CategoryView: View {
    
    private let title: String
    private let description: String
    private let width: CGFloat
    private let height: CGFloat
    private let color: Color
    
    init(
        title: String,
        description: String = "",
        width: CGFloat,
        height: CGFloat,
        color: Color
    ) {
        self.title = title
        self.description = description
        self.width = width
        self.height = height
        self.color = color
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(width: width, height: height)
            .background(color)
            .cornerRadius(16)
            .shadow(
                color: color,
                radius: 1,
                x: 0,
                y: 0
            )
        }
    }
}
