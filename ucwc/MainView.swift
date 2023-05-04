//
//  MainView.swift
//  ucwc
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

struct MainView: View {
    @Binding var fullName: String
    
    var body: some View {
        TabView {
            // Tampilan ketika memilih tab home
            HomeView(fullName: $fullName)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Tampilan ketika memilih tab cart
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(fullName: .constant("Rivaldo"))
    }
}
