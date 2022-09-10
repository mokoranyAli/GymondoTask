//
//  ExercisesListViewController.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

class ExercisesListViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    weak var coordinator: ExerciseListCoordinatorProtocol?
    let viewModel: ExerciseListViewModel
    
    init(viewModel: ExerciseListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupOnChangeState(in: viewModel)
        setupOnReceiveNewData()
        self.title = "Exercise List"
    }
    
    // MARK: - Handlers
    private func setupOnReceiveNewData() {
        viewModel
            .$exercises
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }.store(in: &viewModel.cancellables)
    }
}

// MARK: - Configure Table View
//
private extension ExercisesListViewController {
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCells(in: tableView)
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.registerCellNib(ExerciseTableViewCell.self)
    }
}

// MARK: - UITableViewDelegate
extension ExercisesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exerciseID = viewModel.exercises[safe: indexPath.row]?.id else { return }
        coordinator?.showExerciseDetails(id: exerciseID)
    }
}

// MARK: - UITableViewDataSource
//
extension ExercisesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ExerciseTableViewCell.self)
        let exercise = viewModel.exercises[indexPath.row]
        cell.configure(with: exercise)
        
        return cell
    }
}
