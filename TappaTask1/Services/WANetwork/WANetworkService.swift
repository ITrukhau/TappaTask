//
//  WANetworkService.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Foundation
import Moya

enum WAStatus: String {
    case actual
}

enum WAMessageType: String {
    case alert
}

enum WANetworkService {
    case alert(status: WAStatus, messageType: WAMessageType)
}

extension WANetworkService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.weather.gov")!
    }
    
    var path: String {
        switch self {
        case .alert:
            return "/alerts/active"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .alert:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case let .alert(status, messageType):
            let parameters = ["status": status.rawValue,
                              "message_type": messageType.rawValue]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}

