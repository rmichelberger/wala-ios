//
//  Order.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import Foundation

struct Order: Identifiable {
    let id = UUID().uuidString
    let product: Product
    var amount: Int

    mutating func increase() {
        amount += 1
    }

    mutating func decrease() {
        amount -= 1
    }

}

extension Order {
    
    static let empty = Order(product: Product.empty, amount: 0)
    
    static let mock = Order(product: Product.mock.first!, amount: 3)
}
