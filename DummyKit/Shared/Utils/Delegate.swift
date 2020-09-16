////  Delegate.swift
//  HabitApp
//
//  Created by hexch on 2020/08/12.
//  github:https://github.com/hexch
//
//  Copyright © 2020 homeneco01. All rights reserved.
//

import Foundation
public class Delegate<Input, Output> : Equatable,Identifiable{
    public static func == (lhs: Delegate<Input, Output>, rhs: Delegate<Input, Output>) -> Bool {
        lhs.id == rhs.id
    }
    
    public init() {}
    
    private var block: ((Input) -> Output?)?
    public func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
    
    public func call(_ input: Input) -> Output? {
        return block?(input)
    }
}

public extension Delegate where Input == Void {
    func call() -> Output? {
        return call(())
    }
}
