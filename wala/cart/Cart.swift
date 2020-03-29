//
//  Cart.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

enum Delivery {
    case pickup
    case delivered
}

struct Cart {
    
    private init(){}
    
    var shopId: String?
    
    var orders = [Order]()
//    @Published var totalPrice = Money(currency: .CHF, amount: 0)

    var totalPrice: Money {
        var amount = orders.reduce(0) { (result, order) -> Double in
            print("\(order.product.name) \(order.amount)")
            return result + (order.product.price.amount * Double(order.amount))
        }
        if delivery == .delivered {
            amount += 5
        }
        print("total: \(amount)")
        return  Money(currency: .CHF, amount: amount)
    }
    
    var delivery: Delivery = .pickup {
        didSet {
            didUpdate()
        }
    }
    
    func didUpdate() {
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("CartDidUpdate"), object: nil)
    }
    
    mutating func clear() {
        orders.removeAll()
        didUpdate()
    }
    
    mutating func add(product: Product) -> Bool {
        
        if let shopId = shopId, shopId != product.shopId {
            return false
        }
        
        shopId = product.shopId
        
        if var order = orders.filter({$0.product.id == product.id}).first {
            print("increase")
            order.amount += 1
        } else {
            print("new")
            orders.append(Order(product: product, amount: 1))
        }
        
        for order in orders {
            print("\(order.product.name) \(order.amount)")
        }
        
        didUpdate()
        
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
            
            didUpdate()
        }
    }
        
}


extension Cart {
    
    static var shared = Cart()
}
