//
//  CartView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import SwiftUI
import Combine

struct CartView: View {
    
    private let cartStore = CartStore()
    @State private var ordersSub: AnyCancellable?
    
    @State private var orders = [Order]()
    
    
    @State private var selectorIndex = 0
    @State private var deliveries = ["Pickup - free","Delivered - \(Money(currency: .CHF, amount: 5).string)"]
    
    func onPickerChange(_ tag: Int) {
        print("Color tag: \(tag)")
        Cart.shared.delivery = tag == 0 ? .pickup : .delivered
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                if orders.isEmpty {
                    Text("Oops, your cart is empty. 😞\nGo and fill it.\n\nSupport local businesses.\n💙💚💛💜❤️🖤\n\nBe a hero 🦸‍♀️🦸‍♂️").padding().font(.headline)
                } else {
                    List(orders) { order in
                        OrderRow(order: order)
                    }
                    Picker("Delivery", selection: $selectorIndex.onChange(onPickerChange)) {
                        ForEach(0 ..< deliveries.count) { index in
                            Text(self.deliveries[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Text("Total: \(cartStore.totalPrice.string)").font(.title)
                    Spacer()
                    Button("Order") {
                        
                    }.padding()
                    Spacer()
                }
                }
            .onAppear() {
                
                self.cartStore.update()
                self.ordersSub?.cancel()
                self.ordersSub = self.cartStore.ordersPublisher
                    .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                    .subscribe(on: RunLoop.main)
                    .sink { (orders) in
                        
                        print(orders.count)
                        self.orders = orders
                }
            }.onDisappear(){
                self.ordersSub?.cancel()
            }.navigationBarItems(trailing: orders.isEmpty ? nil : Button(action: {
                Cart.shared.clear()
            }, label: {
                Image(systemName: "trash")
            }))
            .navigationBarTitle("Cart")
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
