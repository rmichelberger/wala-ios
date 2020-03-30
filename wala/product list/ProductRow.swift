//
//  ProductRow.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    @State var wrongShop = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                URLImageView(url: URL(string: product.imageUrl), clipShape: Rectangle()) {
                    Rectangle().fill(Color.wala)
                }.frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                    Text(product.price.string).font(.headline)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    self.wrongShop = !Cart.shared.add(product: self.product)
                }) {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .accessibility(hint: Text("Add product to cart"))
                        .padding(8).accentColor(Color.wala)
                }.accentColor(Color.wala)
            }
            Text(product.description).font(.caption)
            
        }
        .alert(isPresented: self.$wrongShop) {
            Alert(title: Text("You have already ordered from other shop."), message: Text("Please continue order from the same shop, or go to \"Cart\" tab, and empty your cart."), dismissButton: .default(Text("Ok")))
            
        }
        
    }
    
}

#if DEBUG
struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.mock(shop: Shop.mock).first!)
    }
}
#endif
