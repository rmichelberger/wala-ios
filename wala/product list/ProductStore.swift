//
//  ProductStore.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

final class ProductStore: ObservableObject {
    
    @Published var products = [Product]()

    func loadProducts(for shop: Shop) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            var products = Product.mock(shop: shop)
            products.insert(Product.voucher(shop: shop), at: 0)
            self?.products = products
        }
    }
}
