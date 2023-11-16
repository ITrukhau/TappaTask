//
//  WAListViewModel.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Foundation

protocol WAListViewModelProtocol {
    var dataSource: Box<[WeatherAlert]> { get }
    
    func loadData()
}

final class WAListViewModel: WAListViewModelProtocol {
    private let networkProvider = WANetworkProvider()
    
    var dataSource: Box<[WeatherAlert]> = Box([])
    
    func loadData() {
        networkProvider.getWeatherAlerts(status: "actual", messageType: "alert") {
            [weak self] result in
            switch result {
            case .success(let response):
                self?.dataSource.value = response.features
            case .failure(let error):
                print(error)
            }
        }
    }
}
