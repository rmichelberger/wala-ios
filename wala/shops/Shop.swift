//
//  Shop.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseFirestore

struct Shop {
    let id: String
    let name: String
    let about: String
    let iconUrl: String
    let coverImageUrl: String
    let coordinates: CLLocationCoordinate2D
    let category: Category
    let phone: String
    let pickupHours: String
}

extension Shop {
    
    init?(documentSnapshot: DocumentSnapshot) {
        guard let dict = documentSnapshot.data() else { return nil }
        self.init(id: documentSnapshot.documentID, dict: dict)
    }
    
    private init?(id: String, dict: [String: Any]) {
        guard
            let name = dict["name"] as? String,
            let about = dict["about"] as? String,
            let iconUrl = dict["iconUrl"] as? String,
            let phone = dict["phone"] as? String,
            let pickupHours = dict["pickupHours"] as? String,
            let coverImageUrl = dict["coverImageUrl"] as? String,
            let latitude = dict["latitude"] as? Double,
            let longitude = dict["longitude"] as? Double,
            let category = dict["category"] as? String
            else { return nil }
        self.id = id
        self.name = name
        self.about = about
        self.iconUrl = iconUrl
        self.coverImageUrl = coverImageUrl
        self.category = Category(rawValue: category) ?? .unknown
        self.coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.phone = phone
        self.pickupHours = pickupHours
    }
}

extension Shop {
    
    static let mock = Shop(id: "shopId", name: "Name", about: "About", iconUrl: "", coverImageUrl: "", coordinates: CLLocationCoordinate2D(), category: .unknown, phone: "", pickupHours: "")
}


enum Category: String {
    case unknown
    case food
    case fashion
    case book
    case flower
    
    var color: UIColor {
        let color: UIColor
        
        switch self {
        case .book: color = UIColor.systemBlue
        case .fashion: color = UIColor.systemPurple
        case .food: color = UIColor.systemOrange
        case .flower: color = UIColor.systemGreen
        case .unknown: color = UIColor.wala
        }
        
        return color
    }
}
