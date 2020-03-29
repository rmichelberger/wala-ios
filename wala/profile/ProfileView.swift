//
//  ProfileView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    
    @ObservedObject private var profileStore = ProfileStore()
    
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("Name")){
                    TextField("First name, last name", text: $profileStore.name)
                }
                Section(header: Text("Address")){
                    VStack(alignment: .leading) {
                        TextField("Country", text: $profileStore.country)
                        TextField("ZIP", text: $profileStore.zip)
                        TextField("City", text: $profileStore.city)
                        TextField("Street, Nr.", text: $profileStore.street)
                    }
                }
                Section(header: Text("Phone")){
                    TextField("+41 78 XXX XXXX", text: $profileStore.phone)
                }
                Section {
                    HStack {
                        Spacer()
                        Image(systemName: "cart").resizable().frame(width: 200, height: 200)
                        Spacer()
                    }.padding(.vertical, 30)
                }
                
            }
            .navigationBarTitle("Me")
            .navigationBarItems(trailing: Button("Save"){
                self.profileStore.save()
                UIApplication.shared.endEditing()
            })
        }
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
