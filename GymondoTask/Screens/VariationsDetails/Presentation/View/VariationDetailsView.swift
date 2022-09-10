//
//  VariationDetailsView.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import SwiftUI

struct VariationDetailsView: View {
    
    @StateObject var viewModel: VariationsDetailsViewModel
    
    var body: some View {
        BaseView(state: $viewModel.state) {
            contentView
        }
    }
    
    var contentView: some View {
        ScrollView {
            VStack {
                viewModel
                    .exerciseName
                    .text
                    .font(.title.bold())
                
                HStack {
                    "Variation Number:".text
                    String(viewModel.variation).text
                }
            }
        }
    }
}
