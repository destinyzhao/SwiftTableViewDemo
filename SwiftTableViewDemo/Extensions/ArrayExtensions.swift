//
//  ArrayExtensions.swift
//  SwiftTableViewDemo
//
//  Created by Alex on 16/7/21.
//  Copyright © 2016年 Alex. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func removeObject<T where T : Equatable>(obj: T) {
        self = self.filter({$0 as? T != obj})
    }
}