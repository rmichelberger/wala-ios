//
//  Money.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import Foundation

struct Money {
    let currency: Currency
    let amount: Double
}

enum Currency: String {
    case CHF
    case EUR
    case USD
}

extension Money {
    
    static let zero = Money(currency: .CHF, amount: 0)
    
    var string: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency.rawValue
        return formatter.string(from: NSNumber(value: amount)) ?? "N.a"
    }
}
