//
//  WAListViewController.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

final class WAListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }

    private func configureTableView() {
        tableView.dataSource = self
        
        let waNib = UINib(nibName: WATableViewCell.identifier, bundle: nil)
        tableView.register(waNib, forCellReuseIdentifier: WATableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension WAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WATableViewCell.identifier,
                                                       for: indexPath) as? WATableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}
