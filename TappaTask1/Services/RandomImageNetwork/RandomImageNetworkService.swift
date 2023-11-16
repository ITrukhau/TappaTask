//
//  RandomImageNetworkService.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Moya

enum RandomImageNetworkService {
    case random
}

extension RandomImageNetworkService: TargetType {
    var baseURL: URL {
        URL(string: "https://picsum.photos")!
    }
    
    var path: String {
        switch self {
        case .random:
            return "/1000"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}
