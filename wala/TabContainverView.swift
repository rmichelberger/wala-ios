//
//  TabContainverView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import SwiftUI

struct TabContainverView: View {
    
    

       
    var body: some View {
        TabView {
            ShopsView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Shops")
            }.tag(0)

//            DiscoverView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Discover")
//            }.tag(1)

            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }.tag(1)

            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Me")
            }.tag(2)

        }.accentColor(Color.wala)
        .edgesIgnoringSafeArea(.top)
        .onAppear() {
        }
        .onDisappear(){
        }
    }
}

#if DEBUG
struct TabContainverView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainverView().environment(\.colorScheme, .dark)
    }
}
#endif
