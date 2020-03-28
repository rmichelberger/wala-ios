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
    @Published var loading = false

    func loadProducts(for shop: Shop) {
        loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            var products = Product.mock
            products.insert(Product.custom, at: 0)
            products.insert(Product.voucher, at: 0)
            self?.products = products
            self?.loading = false
            print(self?.products.count ?? 0)
        }
    }
}
