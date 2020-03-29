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
        
    var body: some View {
        VStack{
            
            List(self.productStore.products) { product in
//                NavigationLink(destination: ProductView(product: product)) {
                ProductRow(product: product)
//                }
            }.onAppear(){
                if let shop = self.shop {
                    self.productStore.loadProducts(for: shop)
                }
            }
        }
        .navigationBarTitle("Products")
    }
}


#if DEBUG
struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(shop: Shop.mock.first!, productStore: ProductStore())
    }
}
#endif
