//
//  ProductView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    let product: Product
    
    var body: some View {
        Text("Hello, World!")
    }
}

#if DEBUG
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.mock.first!)
    }
}
#endif
