//
//  UIViewController+States.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import UIKit

protocol LoadingDisplayer {
    func startLoading()
    func endLoading()
}

protocol AlertDisplayer {
    func displayAlert(with title: String?, message: String?, actions: [UIAlertAction]?)
    func displayErrorAlert(with title: String?, message: String?)
}

extension UIViewController {
    static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
}

extension LoadingDisplayer where Self: BaseViewController {
    
    func startLoading() {
        self.view.showLoading()
    }
    
    func endLoading() {
        self.view.stopLoading()
    }
}

extension AlertDisplayer where Self: UIViewController {
    func displayAlert(with title: String?, message: String?, actions: [UIAlertAction]? = nil) {
        guard presentedViewController == nil else {
            return
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions?.forEach { action in
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }
    
    func displayErrorAlert(with title: String?, message: String?) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        displayAlert(with: title, message: message, actions: [action])
    }
}
