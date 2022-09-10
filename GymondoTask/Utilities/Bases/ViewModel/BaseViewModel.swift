//
//  BaseViewModel.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Combine

class BaseViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var alertItem: AlertItem?
    @Published var state: ViewModelState = .idle
}
