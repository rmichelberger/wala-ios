//
//  CustomProductView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct CustomProductView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let shop: Shop

    @State private var text = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(
                """
Examples:
 - 1 liter milk, 2 kg brown rice
 - Book: Steve Jobs by Walter Isaacson
 - Electricity in my flat is not working. Could you please fix it?
"""
            )
                .font(.caption)
            TextView(text: $text) { text in
                
            }
            
            HStack {
                Spacer()
                Button("Add to cart") {
                    let product = Product(id: UUID().uuidString, name: "Wish list", description: self.text, price: Money.zero, imageUrl: "", shopId: self.shop.id)
                    let _ = Cart.shared.add(product: product)
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                }.disabled(text.isEmpty)
                Spacer()
            }
        }
        .padding()
        .modifier(AdaptsToSoftwareKeyboard())
        .animation(.easeInOut(duration: 0.3))
            
        .navigationBarTitle("Wish list")
    }
}


#if DEBUG
struct CustomProductView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProductView(shop: Shop.mock)
    }
}
#endif
