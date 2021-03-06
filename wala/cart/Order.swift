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

#if DEBUG
extension Order {
    
    static let mock = Order(product: Product.mock(shop: Shop.mock).first!, amount: 3)
}
#endif
