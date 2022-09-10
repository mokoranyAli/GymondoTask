//
//  UIView+Helpers.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

// MARK: - UIView Class Methods
//
extension UIView {
  
  /// Returns the Nib associated with the received: It's filename is expected to match the Class Name
  ///
  class func loadNib() -> UINib {
    return UINib(nibName: classNameWithoutNamespaces, bundle: nil)
  }
}

// MARK: - UIView+Loading
//
extension UIView {
    
    private static let loadingViewTag = 26121995 // random number for tag
    
    /// Show loading indicator in center of view
    ///
    func showLoading(style: UIActivityIndicatorView.Style = .medium) {
        
        var loadingView = viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView

        if loadingView == nil {
            loadingView = makeActivityIndicatorView(with: style)
        }
        
        if let loadingView = loadingView {
            addSubview(loadingView)
            setupConstraints(for: loadingView)
        }
    }
    
    /// Remove loading view that appears in any view with tag
    ///
    func stopLoading() {
        let loading = viewWithTag(UIView.loadingViewTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
        loading?.removeFromSuperview()
    }
}

// MARK: - Private Handlers
//
private extension UIView {
    
    func makeActivityIndicatorView(with style: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
        let loadingView = UIActivityIndicatorView(style: style)
        setupLoadingViewToAnimate(loadingView)
        return loadingView
    }
    
    func setupConstraints(for loadingView: UIActivityIndicatorView) {
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupLoadingViewToAnimate(_ loadingView: UIActivityIndicatorView) {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.startAnimating()
        loadingView.hidesWhenStopped = true
        loadingView.tag = UIView.loadingViewTag
    }
}
