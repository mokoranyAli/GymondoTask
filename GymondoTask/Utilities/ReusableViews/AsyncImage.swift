//
//  AsyncImage.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct AsyncImage: View {
    let url: URL?
    let placeholder: Image?
    let width: CGFloat
    let height: CGFloat
    
    init(
        url: URL?,
        placeholder: Image? = Image("placeholder-image-icon"),
        width: CGFloat = 150,
        height: CGFloat = 150
    ) {
        self.url = url
        self.placeholder = placeholder
        self.width = width
        self.height = height
    }
    
    init(
        url: String?,
        placeholder: Image? = Image("placeholder-image-icon"),
        width: CGFloat = 150,
        height: CGFloat = 150
    ) {
        self.url = .init(string: url ?? "")
        self.placeholder = placeholder
        self.width = width
        self.height = height
    }
    var body: some View {
        WebImage(url: self.url)
            .resizable()
        
            .placeholder {
                self.placeholder?
                    .resizable()
            }
            .indicator(.activity)
            .transition(.fade(duration: 1))
            .frame(width: width, height: height)
    }
}
