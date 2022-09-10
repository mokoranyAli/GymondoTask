//
//  UIImageView+LoadImage.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import UIKit
import SDWebImage

// MARK: - ImageLoader
//
protocol ImageLoader {
    
    /// Set image using url as string and placeholder image in case of failure to fetch the image
    ///
    func setImage(urlString: String?, placeholder: UIImage?)
}

// MARK: - UIImageView + ImageLoader Conformance
//
extension UIImageView: ImageLoader {
    
    func setImage(urlString: String?, placeholder: UIImage? = .placeHolder) {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: placeholder)
    }
}
