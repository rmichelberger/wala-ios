//
//  ProfileStore.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

final class ProfileStore: ObservableObject {
    
    @Published var name: String
    
    @Published var country: String
    @Published var city: String
    @Published var zip: String
    @Published var street: String

    @Published var phone: String
    
    private var nameKey = "name"
    
    private var countryKey = "country"
    private var cityKey = "city"
    private var zipKey = "zip"
    private var streetKey = "street"

    private var phoneKey = "phone"

    init() {
        let userDefaults = UserDefaults.standard
        
        name = userDefaults.string(forKey: nameKey) ?? ""

        country = userDefaults.string(forKey: countryKey) ?? ""
        city = userDefaults.string(forKey: cityKey) ?? ""
        zip = userDefaults.string(forKey: zipKey) ?? ""
        street = userDefaults.string(forKey: streetKey) ?? ""

        phone = userDefaults.string(forKey: phoneKey) ?? ""
    }
    
    func save() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(name, forKey: nameKey)

        userDefaults.set(country, forKey: countryKey)
        userDefaults.set(city, forKey: cityKey)
        userDefaults.set(zip, forKey: zipKey)
        userDefaults.set(street, forKey: streetKey)

        userDefaults.set(phone, forKey: phoneKey)

        userDefaults.synchronize()
    }


}
