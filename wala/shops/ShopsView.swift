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
    
    @ObservedObject private var shopStore = ShopStore()
    
    var topInsets: CGFloat {
        if let window = UIApplication.shared.delegate?.window, let orientation = window?.windowScene?.interfaceOrientation, let safeAreaInsets = window?.safeAreaInsets {
            if orientation.isPortrait {
                return safeAreaInsets.top
            } else {
                return safeAreaInsets.left
            }
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                //                NavigationLink(destination: ShopDetailView(shop: selectedShop), isActive: self.$isActive) {
                NavigationLink(destination: ShopDetailView(shop: selectedShop ?? Shop.mock), isActive: self.$isActive) {
                    EmptyView()
                }
                MapView(shops: shopStore.shops, isActive: $isActive, selectedShop: $selectedShop)        .edgesIgnoringSafeArea(.top)
                
                VStack {
                    HStack(alignment: .top) {
                        
                        RoundedRectangle(cornerRadius: 10).fill(Color.blue).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.orange).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.purple).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.pink).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.green).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.yellow).frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 10).fill(Color.red).frame(width: 30, height: 30)

                    }
                    //.frame(height: 80)
                    Spacer()
                }.padding(.top, 50)
                //.padding(.top, 40)
                
            }.onAppear() {
                self.shopStore.load()
            }.onDisappear() {
                self.shopStore.stopLoad()
            }
//                            .navigationBarTitle("Shops")
                .edgesIgnoringSafeArea(.top)
            
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
