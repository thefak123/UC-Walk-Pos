//
//  HomeView.swift
//  ucwc
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Tampilan halaman home
struct HomeView: View {
    @Binding var fullName: String
    
    // Membuat column lebih responsive
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var data: [Int] = Array(1...5)
    
    var body: some View {
        GeometryReader { screen in
            VStack(alignment: .leading) {
                // Section header dengan button profile
                HStack {
                    Image("avatar_male")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Welcome!")
                        Text(fullName)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    
                }
                
                
                Divider()
                
                Text("Select Your Cafetaria")
                    .font(.system(.title).bold())
                
                // List cafe secara horizontal
                ScrollView {
                    ForEach(0..<dummyCafe.count, id: \.self) { id in
                        NavigationLink(destination: CafeView(cafeId: id)) {
                            CafeItemView(cafeName: dummyCafe[id].name, cafeThumbnail: dummyCafe[id].image)
                                .padding(.bottom, 16)
                        }
                            
                    }
                }
            }
            .padding(16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(fullName: .constant("Rivaldo"))
    }
}
