//
//  WANetworkProvider.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Alamofire
import Moya

final class WANetworkProvider {
    private lazy var provider: MoyaProvider<WANetworkService> = {
        let redirector = Redirector(behavior: .follow)
        let session = Session(redirectHandler: redirector)
        return MoyaProvider<WANetworkService>(session: session)
    }()
    
    func getWeatherAlerts(status: String, messageType: String, completion: @escaping (Result<WAListResponse, Error>) -> Void) {
        provider.request(.alert(status: status, messageType: messageType)) { result in
            switch result {
            case let .success(response):
                do {
                    let list = try response.map(WAListResponse.self)
                    completion(.success(list))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
