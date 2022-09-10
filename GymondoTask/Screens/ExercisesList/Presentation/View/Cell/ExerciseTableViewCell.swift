//
//  ExerciseTableViewCell.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit
import Combine

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    let viewModel = LoadImageViewModel()
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setubOnGetImageURL()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        exerciseImageView.image = nil
    }
    
    // MARK: - Handlers
    private func setubOnGetImageURL() {
        viewModel
            .$imageURL
            .receive(on: DispatchQueue.main)
            .sink { [weak self] url in
                self?.exerciseImageView.setImage(urlString: url)
            }.store(in: &viewModel.cancellables)
    }
    
    func configure(with exercise: Exercise) {
        nameLabel.text = exercise.name
        guard let id = exercise.id else { return }
        viewModel.loadImageURL(id: id)
    }
}
