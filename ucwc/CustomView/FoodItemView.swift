//
//  FoodItemView.swift
//  ucwc
//
//  Created by Rivaldo Fernandes on 27/04/23.
//

import SwiftUI

struct FoodItemView: View {
    var foodName: String
    var foodThumbnail: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(foodName)
                .font(.system(.body).bold())
                .padding(.horizontal, 4)
                .padding(.vertical, 6)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.7))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                
        }
        .frame(width: 170, height: 200)
        .background(
            Image(foodThumbnail)
                .resizable()
                .scaledToFill()
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(foodName: "Kentang Rebus", foodThumbnail: "food_1")
    }
}
