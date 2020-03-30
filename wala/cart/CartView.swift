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
    
    @State private var paymentIndex = 0
    @State private var payments = ["Twint","Bill"]
    
    
    @State private var showingAlert = false
    
    func onPickerChange(_ tag: Int) {
        Cart.shared.delivery = tag == 0 ? .pickup : .delivered
    }
    
    func onPaymentPickerChange(_ tag: Int) {
        //        Cart.shared.delivery = tag == 0 ? .pickup : .delivered
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                if orders.isEmpty {
                    Text("Oops, your cart is empty. 😞\nGo and fill it.\n\nSupport local businesses.\n💙💚💛💜❤️🖤\n\nBe a hero 🦸‍♀️🦸‍♂️").padding().font(.headline)
                } else {
                    List(orders) { order in
                        NavigationLink(destination: ProductView(product: order.product)) {
                        OrderRow(order: order)
                        }
                    }
                    
                    Picker("Delivery", selection: $selectorIndex.onChange(onPickerChange)) {
                        ForEach(0 ..< deliveries.count) { index in
                            Text(self.deliveries[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    Picker("Payment", selection: $paymentIndex.onChange(onPaymentPickerChange)) {
                        ForEach(0 ..< payments.count) { index in
                            Text(self.payments[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    Text("Total: \(cartStore.totalPrice.string)").font(.title)
                    Spacer()
                    Button("Order") {
                        
                        if ProfileStore().isComplete {
                            
                        } else {
                            self.showingAlert = true
                        }
                        
                        
                    }.padding()
                    Spacer()
                }
            }
                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text("Perseonal information missing"), message: Text("Please go to the \"Me\" tab, and fill out the form."), dismissButton: .default(Text("Ok")))
                    Alert(title: Text("Thanks for your order 👍"), message: Text("We will send you a notification once it is ready to pick up 🚀"), dismissButton: .default(Text("Ok")))
                }
            .onAppear() {
                
                self.cartStore.update()
                self.ordersSub?.cancel()
                self.ordersSub = self.cartStore.ordersPublisher
//                    .debounce(for: .milliseconds(100), scheduler: RunLoop.main)
                    .subscribe(on: RunLoop.main)
                    .sink { (orders) in
                        
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
