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
        Product(id: "voucher", name: "Voucher", description: "Please buy this voucher. It can be used after COVID-19 has ended.", price: Money(currency: .CHF, amount: 5), imageUrl: "https://firebasestorage.googleapis.com/v0/b/kuvik-8c09f.appspot.com/o/Voucher-01.png?alt=media&token=b582f789-4b5c-43a5-b21d-87dd6bf30576", shopId: shop.id)
    }
        
    static func mock(shop: Shop) -> [Product] {
        [
            Product(id: "1", name: "Product 1", description: "asdfsf asd fs f\nasdfsf asd fs f\nasdfsf asd fs f asdfsf asd fs f\n asdfsf asd fs  asdfsf asd fs f asdfsf asd fs f\nasdfsf asd fs f\n", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
            Product(id: "2", name: "Product 2", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
            Product(id: "3", name: "Product 3", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
            Product(id: "4", name: "Product 4", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: shop.id),
            
            Product(id: "5", name: "Product 5", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
            Product(id: "6", name: "Product 6", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: shop.id),
            
            Product(id: "7", name: "Product 7", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: shop.id),
            Product(id: "8", name: "Product 8", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: shop.id),
            
            
        ]
        
    }
}
