//
//  ProductListView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProductListView: View {
    
    
    let shop: Shop
    @ObservedObject var productStore: ProductStore
    
    var body: some View {
        VStack{
            
            List(self.productStore.products) { product in
                ProductRow(product: product)
            }.onAppear(){
                self.productStore.loadProducts(for: self.shop)
            }
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: CustomProductView(shop: shop), label: {
                //                Text("Products")
                Image(systemName: "square.and.pencil")
            }
        ))
            
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
