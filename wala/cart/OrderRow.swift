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
        VStack {
        Text(order.product.name)
        Text("\(order.amount)")
        }
    }
}

#if DEBUG
struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: Order.mock)
    }
}
#endif
