//
//  Shop.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import UIKit
import CoreLocation

struct Shop {
    let id: String
    let name: String
    let about: String
    let iconUrl: String
    let coordinates: CLLocationCoordinate2D
    let category: Category
}


enum Category: String {
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
        }
        
        return color
    }
}

extension Shop {
    static let mock = [
        Shop(id: "1", name: "Büechli", about: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Feugiat sed lectus vestibulum mattis ullamcorper. Morbi tristique senectus et netus et malesuada fames. Faucibus pulvinar elementum integer enim neque. Tincidunt ornare massa eget egestas purus. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque. Enim neque volutpat ac tincidunt vitae semper quis lectus. Ut diam quam nulla porttitor massa id. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Faucibus in ornare quam viverra orci. Quis lectus nulla at volutpat diam ut venenatis. Tincidunt augue interdum velit euismod. Et ultrices neque ornare aenean. Bibendum est ultricies integer quis auctor. Neque aliquam vestibulum morbi blandit cursus risus at. Lacus vestibulum sed arcu non. Id volutpat lacus laoreet non curabitur gravida. Sit amet nisl purus in mollis nunc.

Mauris ultrices eros in cursus turpis massa tincidunt dui ut. Risus feugiat in ante metus. Risus nec feugiat in fermentum posuere. Massa tempor nec feugiat nisl pretium. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Et egestas quis ipsum suspendisse ultrices gravida dictum. Eget est lorem ipsum dolor sit amet. Nullam non nisi est sit amet facilisis magna. Nulla posuere sollicitudin aliquam ultrices sagittis. Ac felis donec et odio pellentesque diam volutpat. Porttitor massa id neque aliquam vestibulum morbi blandit cursus. Cursus in hac habitasse platea dictumst. Pellentesque dignissim enim sit amet venenatis urna. Eget aliquet nibh praesent tristique magna sit amet purus gravida. Cursus turpis massa tincidunt dui ut ornare lectus.
""", iconUrl: "2", coordinates: CLLocationCoordinate2D(latitude: 47.376288, longitude: 8.541694), category: .book),
        Shop(id: "", name: "Book 2", about: "About", iconUrl: "", coordinates: CLLocationCoordinate2D(latitude: 47.376488, longitude: 8.541390), category: .book),
        Shop(id: "3", name: "Flower 2", about: "About", iconUrl: "", coordinates: CLLocationCoordinate2D(latitude: 47.376188, longitude: 8.541691), category: .flower),
        Shop(id: "4", name: "Flower", about: "About", iconUrl: "", coordinates: CLLocationCoordinate2D(latitude: 47.376888, longitude: 8.541692), category: .flower),
    ]
    
    
}

