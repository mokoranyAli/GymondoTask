//
//  BaseViewController.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

// MARK: - Base ViewController
//
class BaseViewController: UIViewController, LoadingDisplayer, AlertDisplayer {
    
    // MARK: - ViewModel + State Binding Helpers
    
    func setupOnChangeState(in viewModel: BaseViewModel)  {
        viewModel.$state.sink { state in
            switch state {
            case .loading:
                self.startLoading()
                
            case .success:
                self.endLoading()
                
            case .failure(let error):
                self.endLoading()
                self.displayErrorAlert(with: "Error!", message: error.localizedDescription)
                
            default: break
            }
            
        }.store(in: &viewModel.cancellables)
    }
}

