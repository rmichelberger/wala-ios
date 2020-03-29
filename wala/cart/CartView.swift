//
//  CartView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import SwiftUI

struct CartView: View {
    
    

    
    @State var orders = [Order]()
    @State var totalPrice = Money(currency: .CHF, amount: 0)

    var body: some View {
        
        VStack{

            List(orders) { order in
            OrderRow(order: order)
        }
            
            Text("Total: \(totalPrice.string)")
            Spacer()

        }.onAppear(){
//            self.orders = Cart.shared.orders
//            self.totalPrice = Cart.shared.totalPrice
        }
    }
}

#if DEBUG
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
#endif
