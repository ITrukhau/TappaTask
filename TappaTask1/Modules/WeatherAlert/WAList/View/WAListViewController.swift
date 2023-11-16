//
//  WAListViewController.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

final class WAListViewController: UIViewController {
    // MARK: - UI components
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private properties
    private let viewModel: WAListViewModelProtocol
    
    // MARK: - Init
    init(viewModel: WAListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadData()
        
        configureTableView()
        configureBindings()
    }

    // MARK: - Configure
    private func configureTableView() {
        tableView.dataSource = self
        
        let waNib = UINib(nibName: WATableViewCell.identifier, bundle: nil)
        tableView.register(waNib, forCellReuseIdentifier: WATableViewCell.identifier)
    }
    
    private func configureBindings() {
        viewModel.dataSource.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension WAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WATableViewCell.identifier,
                                                       for: indexPath) as? WATableViewCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.dataSource.value[indexPath.row]
        cell.configure(with: item)
    
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.value.count
    }
}
