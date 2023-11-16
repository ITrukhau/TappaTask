//
//  Coordinator.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator] { get set }

    
    func start()
}
