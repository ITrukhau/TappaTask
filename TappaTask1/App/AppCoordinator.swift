//
//  AppCoordinator.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    var navigationController = UINavigationController()
    var children: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        configureWindow()
        
        showWeatherAlertFlow()
    }
    
    private func configureWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    // MARK: - Flows
    private func showWeatherAlertFlow() {
        let weatherAlertCoordinator = WACoordinator(navigationController: navigationController)
        weatherAlertCoordinator.start()
        children.append(weatherAlertCoordinator)
    }
}

