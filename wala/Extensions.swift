//
//  Extensions.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI
import UIKit

extension UIColor {
    
    static let wala = UIColor(red: CGFloat(216.0/255.0), green: CGFloat(90.0/255.0), blue: CGFloat(57.0/255.0), alpha: CGFloat(1.0))
    
}

extension Color {
    
    static let wala = Color(UIColor.wala)
    
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
