//
//  View+Helpers.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
    
    @ViewBuilder
    func overlay<Content: View>(when condition: Bool, _ content: Content) -> some View {
        if condition {
            overlay(content)
        } else {
            self
        }
    }
}

extension String {
    var text: some View {
        Text(self)
    }
}
