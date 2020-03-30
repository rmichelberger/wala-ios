//
//  Product.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

struct Product: Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Money
    let imageUrl: String
    let shopId: String
}


extension Product {
    
    static func voucher(shop: Shop) -> Product {
        Product(id: "voucher", name: "Voucher", description: "Please buy this voucher. It can be used after COVID-19 has ended.", price: Money(currency: .CHF, amount: 20), imageUrl: "https://firebasestorage.googleapis.com/v0/b/wala-ae479.appspot.com/o/Voucher-01.png?alt=media&token=a016cfdb-405a-4bb8-925f-fed00903324a", shopId: shop.id)
    }
        
    static func mock(shop: Shop) -> [Product] {
        [
            Product(id: "1", name: "Steve Jobs Biography", description: "Steve Jobs was born in 1955 and raised by adoptive parents in Cupertino, California. Though he was interested in engineering, his passions as a youth varied. After dropping out of Reed College, Jobs worked as a video game designer at Atari and later went to India to experience Buddhism. In 1976 he helped launch Apple", price: Money(currency: .CHF, amount: 43.80), imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81VStYnDGrL.jpg", shopId: shop.id),

            Product(id: "2", name: "Winnie the Pooh", description: "Winnie-the-Pooh, also called Pooh Bear and Pooh, is a fictional anthropomorphic teddy bear created by English author A. A. Milne. The first collection of stories about the character was the book Winnie-the-Pooh (1926), and this was followed by The House at Pooh Corner (1928).", price: Money(currency: .CHF, amount: 12), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
                         
        ]
        
    }
}
