//
//  CartStore.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI
import Combine

final class CartStore: ObservableObject {
    
    
    var ordersPublisher = PassthroughSubject<[Order], Never>()
    @Published var totalPrice = Money(currency: .CHF, amount: 0)
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: Notification.Name("CartDidUpdate"), object: nil)
        
        update()
    }
    
    @objc func update() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.totalPrice = Cart.shared.totalPrice
            self?.ordersPublisher.send(Cart.shared.orders)
        }
    }

}
