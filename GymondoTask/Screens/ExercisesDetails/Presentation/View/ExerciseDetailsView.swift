//
//  ExerciseDetailsView.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import SwiftUI

struct ExerciseDetailsView: View {
    let coordinator: ExerciseListCoordinatorProtocol
    @StateObject var viewModel: ExerciseDetailsViewModel
    
    var body: some View {
        BaseView(
            state: $viewModel.state,
            alertItem: $viewModel.alertItem
        ) {
            ScrollView {
                contentView
            }
        }
    }
    
    var contentView: some View {
        VStack(alignment: .leading, spacing: 24) {
            nameView
                .padding()
            imagesOrEmptyView
                .padding()
            variationsOrEmptyView
                .padding()
            
            Spacer()
        }
    }
    
    var nameView: AnyView? {
        viewModel
            .exerciseInfo?
            .name?
            .text
            .font(.title.bold())
            .eraseToAnyView()
    }
    
    var imagesOrEmptyView: AnyView {
        if viewModel.images.isEmpty && !isLoading {
            return noImageView.eraseToAnyView()
        }
        return photosView.eraseToAnyView()
    }
    
    var variationsOrEmptyView: AnyView {
        if viewModel.variations.isEmpty && !isLoading {
            return noVariationsView.eraseToAnyView()
        }
        
        return variationView.eraseToAnyView()
    }
    
    
    var photosView: some View {
        horizontalScroll {
            ForEach(viewModel.images, id: \.self) { image in
                AsyncImage(url: image.imageURL)
            }
        }
    }
    
    var noImageView: some View {
        noItemsFoundView(title: "No Images Found")
    }
    
    var variationView: some View {
        horizontalScroll {
            ForEach((viewModel.variations), id: \.self) { variation in
                Button(String(variation)) {
                    if let name = viewModel.exerciseInfo?.name {
                        coordinator.showVariationDetails(
                            variation: variation,
                            exerciseName: name
                        )
                    }
                }
            }.frame(width: 50, height: 50)
        }
    }
    
    var noVariationsView: some View {
        noItemsFoundView(title: "No Variations Found")
    }
}

// MARK: - Helpers
private extension ExerciseDetailsView {
    var isLoading: Bool {
        viewModel.state == .loading
    }
    
    func noItemsFoundView(title: String) -> some View {
        HStack {
            Text(title)
                .font(.title2.bold())
                .foregroundColor(.red)
            Spacer()
        }
    }
    
    func horizontalScroll<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                content()
            }
        }
    }
}
