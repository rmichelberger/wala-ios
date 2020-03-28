//
//  ShopsView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import SwiftUI

struct ShopsView: View {
    
    
    @State var isActive: Bool = false
    @State var selectedShop: Shop?
    
    
    var body: some View {
        NavigationView {
            ZStack {
//                NavigationLink(destination: ShopDetailView(shop: selectedShop), isActive: self.$isActive) {
                NavigationLink(destination: ShopDetailView(shop: Shop.mock.first), isActive: self.$isActive) {
                    EmptyView()
                }
                MapView(shops: Shop.mock, isActive: $isActive, selectedShop: $selectedShop)        .edgesIgnoringSafeArea(.top)
                
                VStack {
                    HStack(alignment: .top) {
                    Rectangle().fill(Color.black).frame(width: 30, height: 30)
                    Rectangle().fill(Color.black).frame(width: 30, height: 30)
                    Rectangle().fill(Color.black).frame(width: 30, height: 30)
                    Rectangle().fill(Color.black).frame(width: 30, height: 30)
                    }//.frame(height: 80)
                Spacer()
                }//.padding(.top, 40)

            }
//            .navigationBarTitle("Shops")
            //.edgesIgnoringSafeArea(.top)

        }
    }
}

#if DEBUG
struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}
#endif
