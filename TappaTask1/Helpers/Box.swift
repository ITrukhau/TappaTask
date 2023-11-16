//
//  Box.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Foundation

public final class Box<T> {
    public typealias Listener = (T) -> Void
    var listener: Listener?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
