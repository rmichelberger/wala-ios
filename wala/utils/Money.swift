//
//  Money.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

struct Money {
    let currency: Currency
    let amount: Double
}

enum Currency: String {
    case CHF
    case EUR
    case USD
}
