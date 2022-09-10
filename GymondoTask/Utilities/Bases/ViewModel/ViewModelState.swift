//
//  ViewModelState.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Foundation

enum ViewModelState {
    case idle
    case loading
    case success
    case failure(Error)
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
            (.success, .success),
            (.idle, .idle):
            return true
            
        case (.failure(let lhsError), .failure(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
            
        default: return false
        }
    }
}

extension ViewModelState {
    /// Get alertItem in case of failed state and error style is alert
    ///
    var alertItem: AlertItem? {
        guard case .failure(let error) = self else { return nil }
        return AlertItem(title: "Error!", message: error.localizedDescription)
    }
}
