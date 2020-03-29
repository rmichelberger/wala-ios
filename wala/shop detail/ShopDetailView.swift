//
//  ShopDetailView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ShopDetailView: View {
    

    let shop: Shop
    
    private let productStore = ProductStore()
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                URLImageView(url:  URL(string: "https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60"), clipShape: Rectangle()) {
                    Rectangle().fill(Color.wala)
                }.frame(height: 200)
                
                URLImageView(url: URL(string: "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60")) {
                    
                    Rectangle().fill(Color.wala)
                    
                    
                }.frame(height: 120).offset(y: -60)
                    .padding(.bottom, -60)
                
                Text("Team").font(.headline).padding()
                URLImageView(url:  URL(string: "https://images.unsplash.com/photo-1484712401471-05c7215830eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60"), clipShape: Rectangle()) {
                    Rectangle().fill(Color.wala)
                }.frame(height: 200)
                
                Text("About").font(.headline).padding()
                Text(shop.about).padding(.horizontal
                )

                Text("Phone").font(.headline).padding()
                Text("+41 78 1223 1212").padding(.horizontal)

                Text("Pickup times").font(.headline).padding()
                Text("Mo-Fr: 09:00-18:00").padding(.horizontal)

                
            }
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: ProductListView(shop: shop, productStore: self.productStore), label: {
                Text("Products")
//                Image(systemName: "cart")
            }
        ))
            //        .edgesIgnoringSafeArea(.top)
            .navigationBarTitle(shop.name)
    }
}

#if DEBUG
struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shop: Shop.mock.first!)
    }
}
#endif
