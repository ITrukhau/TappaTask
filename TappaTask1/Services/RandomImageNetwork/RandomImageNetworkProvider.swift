//
//  RandomImageNetworkProvider.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Alamofire
import Moya
import UIKit

final class RandomImageNetworkProvider {
    private lazy var provider: MoyaProvider<RandomImageNetworkService> = {
        let redirector = Redirector(behavior: .follow)
        let session = Session(redirectHandler: redirector)
        return MoyaProvider<RandomImageNetworkService>(session: session)
    }()
    
    private var imageCache = [Int: UIImage]()
    
    func getRandomImage(for index: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = imageCache[index] {
            completion(.success(cachedImage))
        } else {
            getRandomImageRequest(for: index, completion: completion)
        }
    }
    
    // MARK: - Private methods
    private func getRandomImageRequest(for index: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        provider.request(.random) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let image = try response.mapImage()
                    self.imageCache[index] = image
                    completion(.success(image))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
