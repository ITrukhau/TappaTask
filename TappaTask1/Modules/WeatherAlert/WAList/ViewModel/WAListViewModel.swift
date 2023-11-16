//
//  WAListViewModel.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

protocol WAListViewModelProtocol {
    var dataSource: Box<[WeatherAlert]> { get }
    
    func loadData()
    func loadImage(for index: Int, completion: @escaping (UIImage?) -> Void)
}

final class WAListViewModel: WAListViewModelProtocol {
    private let networkProvider = WANetworkProvider()
    private let randomImageNetworkProvider = RandomImageNetworkProvider()
    
    var dataSource: Box<[WeatherAlert]> = Box([])
    
    func loadData() {
        networkProvider.getWeatherAlerts(status: "actual", messageType: "alert") { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let response):
                    self?.dataSource.value = response.features
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func loadImage(for index: Int, completion: @escaping (UIImage?) -> Void) {
        randomImageNetworkProvider.getRandomImage(for: index) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    completion(image)
                case .failure(let error):
                    completion(nil)
                    print(error)
                }
            }
        }
    }
}
