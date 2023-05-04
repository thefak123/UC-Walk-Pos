//
//  OnBoardingView.swift
//  ucwc
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Tampilan awal aplikasi (Input nama)
struct OnboardingView: View {
    // Full name user
    @State var fullname: String = ""
    
    // State untuk menentukan apakah sudah layak memasuki halaman home
    @State var showHomeView: Bool = false
    
    var body: some View {
        GeometryReader { screen in
            VStack(alignment: .leading) {
                
                Image("onboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: screen.size.height / 2)
                
                // input name
                Text("Hello, What's your name?")
                    .font(.system(.title, design: .rounded))
                
                TextField("Name", text: $fullname)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showHomeView = true
                    }) {
                        Text("Continue")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 32)
                    .disabled(fullname.isEmpty)
                    .fullScreenCover(isPresented: $showHomeView) {
                        NavigationView {
                            MainView(fullName: $fullname)
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(32)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
