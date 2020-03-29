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
}

extension Order {
    static let mock = Order(product: Product.mock.first!, amount: 3)
}
