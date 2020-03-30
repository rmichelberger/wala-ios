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
                for documentChange in querySnapshot.documentChanges {
                    self?.addShop(from: documentChange)
                }
            }

        }
    }
    
    func stopLoad() {
        shopsCollectionChangeListener?.remove()
    }
    
    private func addShop(from documentChange: DocumentChange) {
         
         switch documentChange.type {
         case .added:
             if let shop = Shop(documentSnapshot: documentChange.document) {
                 shops.append(shop)
             }
         case .modified:
             let oldIndex = Int(documentChange.oldIndex)
             if oldIndex < shops.count {
                // todo
//                 shops[oldIndex].udpate(from: documentChange)
             }
         case .removed:
             let oldIndex = Int(documentChange.oldIndex)
             if shops.count < oldIndex {
                 shops.remove(at: oldIndex)
             }
         }
//         messagesPublisher.send(messages)
     }

}
