//
//  LoginScreen.swift
//  Salva
//
//  Created by Federico García-Lorca on 13/06/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LoginScreen : View {
    var body: some View {
        NavigationView() {
            VStack() {
                HStack() {
                    Image(systemName: "person.crop.circle")
                        .frame(width: 20)
                    TextField(.constant(""),
                              placeholder: Text("Email"))
                    .textFieldStyle(.roundedBorder)
                    
                }
                HStack() {
                    Image(systemName: "lock.fill")
                    .frame(width: 20)
                    TextField(.constant(""),
                              placeholder: Text("Password"))
                    .textFieldStyle(.roundedBorder)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Enter")
                }
                }
                .padding()
                .navigationBarItems(leading:
                    Button(action: {}) {
                        Text("OK")
                    }
            )
        }
    }
}

#if DEBUG
struct LoginScreen_Previews : PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
#endif
