//
//  Array+Only.swift
//  MemoryGame
//
//  Created by Yuliya  on 8/10/22.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
