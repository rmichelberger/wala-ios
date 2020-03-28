//
//  DiscoverView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {

        
        List(0...3) { i in
            DiscoverView()
        }
        
    }
}

struct DiscoverRow: View {
        
    var body: some View {
        
        // statuses
                      ScrollView(.horizontal, content: {
                          HStack(spacing: 10) {
                            ForEach(0...3) { i in
                                  ProductItemView(i: i)
                              }
                          }
                          .padding(.leading, 10)
                      })
                      //.frame(height: 190)
        
    }
}

extension Int: Identifiable {
    
    public var id: String {
        return "\(self)"
    }
}

struct ProductItemView: View {
    
    let i: Int
    
    var body: some View {
                
        Text("Discover \(i)")
    }
}


#if DEBUG
struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
#endif
