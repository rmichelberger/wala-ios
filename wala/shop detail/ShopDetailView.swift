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
                
                VStack {
                Image("cover").frame(height: 200)
                
//                URLImageView(url:  URL(string: shop.coverImageUrl), clipShape: Rectangle()) {
//                    Rectangle().fill(Color.wala)
//                }.frame(height: 200)

                Image("logo").frame(height: 120).offset(y: -120)
                .padding(.bottom, -60)
                    .shadow(radius: 8)
                }

//                URLImageView(url: URL(string: shop.iconUrl)) {
//
//                    Rectangle().fill(Color.wala)
//
//
//                }.frame(height: 120).offset(y: -60)
//                    .padding(.bottom, -60)
                

                VStack(alignment: .leading) {
                    Text("About").font(.headline).padding(.top)
                    Text(shop.about)
                    
                    Text("Phone").font(.headline).padding(.top)
                    Text(shop.phone)
                    
                    Text("Pickup times").font(.headline).padding(.top)
                    Text(shop.pickupHours).padding(.bottom)
                }.padding(.horizontal)
                
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
        ShopDetailView(shop: Shop.mock)
    }
}
#endif
