//
//  WACoordinator.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

protocol WACoordinatorProtocol: Coordinator {
    func showErrorAlert(_ error: Error)
}

final class WACoordinator: WACoordinatorProtocol {
    var navigationController: UINavigationController
    var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showWAList()
    }
        
    // MARK: - Flows
    private func showWAList() {
        let viewModel = WAListViewModel(coordinator: self)
        let controller = WAListViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showErrorAlert(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        
        navigationController.present(alert, animated: true)
    }
}
