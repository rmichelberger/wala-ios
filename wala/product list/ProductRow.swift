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
        HStack {
            URLImageView(url: URL(string: product.imageUrl), clipShape: Rectangle()) {
                Rectangle().fill(Color.secondary)
            }.frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(product.name)
                Text(product.description).font(.caption)
                Spacer()
                Text(product.price.string).font(.headline)
            }
            Spacer()
//            VStack{
                Button(action: {
                    self.wrongShop = !Cart.shared.add(product: self.product)
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .accessibility(hint: Text("Create new discussion"))
                        .padding().accentColor(Color.wala)
                }.accentColor(Color.wala)

                
//            }
        } .sheet(isPresented: self.$wrongShop) {
            Text("Please order from the same shop")
        }

    }
    
}

#if DEBUG
struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.mock.first!)
    }
}
#endif
