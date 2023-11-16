//
//  WACoordinator.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

final class WACoordinator: Coordinator {
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
        let viewModel = WAListViewModel()
        let controller = WAListViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}
