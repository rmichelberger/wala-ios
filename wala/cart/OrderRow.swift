//
//  OrderRow.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct OrderRow: View {
    
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(order.product.name)
//            Text("Amount: \(order.amount)").font(.caption)
            Text(order.product.price.string).font(.headline)
        }
    }
}

#if DEBUG
struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        List{
            OrderRow(order: Order.mock)
            OrderRow(order: Order.mock)
        }
    }
}
#endif
