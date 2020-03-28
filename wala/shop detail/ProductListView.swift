//
//  ProductListView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    let shop: Shop?
    @ObservedObject var productStore: ProductStore

//    @State private var navigationBarTitle = "Products loading ..."
    
        
    var body: some View {
        List(self.productStore.products) { product in
            ProductRow(product: product)
        }.onAppear(){
            if let shop = self.shop {
                self.productStore.loadProducts(for: shop)
            }
        }
        .navigationBarTitle("Products")
    }
}

struct ProductRow: View {

    let product: Product
    
    var body: some View {
        HStack {
            URLImageView(url: URL(string: product.imageUrl), clipShape: Rectangle()) {
                Rectangle().fill(Color.secondary)
            }.frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(product.name)
                Text(product.description).font(.caption)
                Spacer()
            }
        }
    }
    
}

#if DEBUG
struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(shop: Shop.mock.first!, productStore: ProductStore())
    }
}
#endif
