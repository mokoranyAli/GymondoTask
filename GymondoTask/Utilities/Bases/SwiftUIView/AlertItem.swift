//
//  AlertItem.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation

/// Used to display alert in SwiftUI view
///
struct AlertItem {
    let title: String?
    let message: String?
    
    init(
        title: String? = nil,
        message: String?
    ) {
        self.title = title
        self.message = message
    }
}
