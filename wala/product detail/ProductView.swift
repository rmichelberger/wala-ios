//
//  ProductView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                URLImageView(url: URL(string: product.imageUrl), clipShape: Rectangle(), contentMode: .fit) {
                    Rectangle().fill(Color.wala)
                }.frame(height: 200)
                Text(product.price.string).font(.headline).padding()
                Text(product.description).padding(.horizontal)
                Spacer()
            }.navigationBarTitle(product.name)
        }
    }
}

#if DEBUG
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProductView(product: Product.mock(shop: Shop.mock).first!)
        }
    }
}
#endif
