//
//  ShopStore.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import FirebaseFirestore

final class ShopStore: ObservableObject {
    
    @Published private(set) var shops = [Shop]()
    @Published private(set) var error: Error?

    private let shopsCollection = Firestore.firestore().collection("shops")
    private var shopsCollectionChangeListener: ListenerRegistration? = nil

    
    func load() {
        
        shopsCollectionChangeListener = shopsCollection.addSnapshotListener { [weak self] (querySnapshot, error) in
            self?.error = error
            
            if let querySnapshot = querySnapshot {
                for documentSnapshot in querySnapshot.documents {
                    print(documentSnapshot)
                }
            }

        }
    }
    
    func stopLoad() {
        shopsCollectionChangeListener?.remove()
    }

}
