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
    
    static let voucher = Product(id: "voucher", name: "Voucher", description: "Please buy this voucher. It can be used after COVID-19 has ended.", price: Money(currency: .CHF, amount: 5), imageUrl: "https://www.xing.com/imagecache/public/scaled_original_image/eyJ1dWlkIjoiYWVlN2UyYmUtOTBkYy00MGFhLWEyM2ItYWNhNDVhZTQ2YTM2IiwiYXBwX2NvbnRleHQiOiJjb21wYW5pZXMiLCJtYXhfd2lkdGgiOjI1NiwibWF4X2hlaWdodCI6MjU2fQ?signature=5620b28a2fa36ee6dcf022451957611f18daeaa00ee7eaeaf7f9157d41358ae8", shopId: "shop")

    static let custom = Product(id: "custom", name: "Please fill your order in", description: "Please buy this voucher. It can be used after COVID-19 has ended.", price: Money(currency: .CHF, amount: 0), imageUrl: "https://img.icons8.com/wired/64/000000/hand-with-pen.png", shopId: "shop")

    static let empty = Product(id: "empty", name: "Here will come", description: "", price: Money(currency: .CHF, amount: 0), imageUrl: "", shopId: "shop")
    
    static let mock = [
        Product(id: "1", name: "Product 1", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: "shop"),
    Product(id: "2", name: "Product 2", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: "shop"),
    Product(id: "3", name: "Product 3", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: "shop"),
    Product(id: "4", name: "Product 4", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: "shop"),

    Product(id: "5", name: "Product 5", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: "shop"),
    Product(id: "6", name: "Product 6", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: "shop"),
    
    Product(id: "7", name: "Product 7", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://saffadesigns.com/wp-content/uploads/SGCB27-8.jpg", shopId: "shop"),
    Product(id: "8", name: "Product 8", description: "asdfsf asd fs f", price: Money(currency: .CHF, amount: 15), imageUrl: "https://icodrops.com/wp-content/uploads/2017/10/Roadmap-2-3-300x231.png", shopId: "shop"),


    ]
}
