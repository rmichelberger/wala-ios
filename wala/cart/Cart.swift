//
//  Cart.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct Cart {
    
    private init(){}
    
    var shopId: String?
    
    var orders = [Order]()
//    @Published var totalPrice = Money(currency: .CHF, amount: 0)

    var totalPrice: Money {
        let amount = orders.reduce(0) { (result, order) -> Double in
            return result + (order.product.price.amount * Double(order.amount))
        }
        return  Money(currency: .CHF, amount: amount)
    }
    
    mutating func add(product: Product) -> Bool {
        
        if let shopId = shopId, shopId != product.shopId {
            return false
        }
        
        shopId = product.shopId
        
        if var order = orders.filter({$0.product.id == product.id}).first {
            order.amount += 1
        } else {
            orders.append(Order(product: product, amount: 1))
        }
        
        
        return true
    }
    
    mutating func remove(product: Product) {
        if let i = orders.firstIndex(where: { $0.product.id == product.id }) {
            var order = orders[i]
            if order.amount > 1 {
                order.amount -= 1
            } else {
                orders.remove(at: i)
            }
        }
    }
        
}


extension Cart {
    
    static var shared = Cart()
}
