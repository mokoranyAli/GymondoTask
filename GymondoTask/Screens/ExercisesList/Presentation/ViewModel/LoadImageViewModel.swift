//
//  LoadImageViewModel.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Foundation

class LoadImageViewModel: BaseViewModel {
    
    private let loadImageUseCase: LoadExerciseImageUseCaseContract
    private let backgroundQueue = DispatchQueue.global(qos: .background)
    
    @Published private(set) var imageURL: String? = nil
    
    init(loadImageUseCase: LoadExerciseImageUseCaseContract = LoadExerciseImageUseCase()) {
        self.loadImageUseCase = loadImageUseCase
    }
    
    func loadImageURL(id: Int) {
        backgroundQueue.async { [weak self] in
            self?.fetchImage(with: id)
        }
    }
    
    private func fetchImage(with id: Int) {
        loadImageUseCase
            .execute(id: id)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .failure(error)
                }
            } receiveValue: { [weak self] image in
                self?.imageURL = image.imageURL
                self?.state = .success
            }.store(in: &cancellables)
    }
}

