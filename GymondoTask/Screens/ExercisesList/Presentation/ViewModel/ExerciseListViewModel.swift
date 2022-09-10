//
//  ExerciseListViewModel.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Combine
import Foundation

class ExerciseListViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var exercises: [Exercise] = []
    private let loadExercisesUseCase: LoadExercisesUseCaseContract
    
    // MARK: - Init
    init(loadExercisesUseCase: LoadExercisesUseCaseContract = LoadExercisesUseCase()) {
        self.loadExercisesUseCase = loadExercisesUseCase
        super.init()
        loadData()
    }
    
    // MARK: - Handlers
    private func loadData() {
        state = .loading
        loadExercisesUseCase
            .execute()
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .failure(error)
                }
            } receiveValue: { [weak self] list in
                self?.state = .success
                self?.exercises = list
                
            }.store(in: &cancellables)
    }
}

