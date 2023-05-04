//
//  CartView.swift
//  ucwc
//
//  Created by MacBook Pro on 20/04/23.
//

import SwiftUI

// Tampilan halaman keranjang
struct CartView: View {
    // Menentukan apakah button checkout ditampilkan atau tidak
    @State var showCheckOut: Bool = false
    
    // Menentukan data cafe yang akan dicheckout
    @State private var cafeData: [Cafe] = [] {
        didSet {
            total = 0
            cafeData.forEach { cafe in
                cafe.food.forEach { food in
                    total = total + calculateTotal(quantity: food.quantity, price: food.price)
                }
            }
        }
    }
    
    // Total harga keseluruhan
    @State private var total: Double = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            // Jika terdapat product di keranjang
            if (total > 0 ){
                
                ScrollView {
                    ForEach(0..<cafeData.count, id: \.self) { cafeId in
                        // Menampilkan data makanan dari setiap cafe
                        ForEach(0..<cafeData[cafeId].food.count, id: \.self) { foodId in
                            if (cafeData[cafeId].food[foodId].quantity > 0){
                                VStack(alignment: .leading) {
                                    Text(cafeData[cafeId].food[foodId].name)
                                        .font(.system(.title3))
                                    Text("Rp\(cafeData[cafeId].food[foodId].price.formatted(FloatingPointFormatStyle()))")
                                        .font(.system(.body))
                                    
                                    HStack {
                                        // Tombol untuk menambah atau mengurangi kuantitas makanan
                                        Button(action: {
                                            if(cafeData[cafeId].food[foodId].quantity > 0){
                                                cafeData[cafeId].food[foodId].quantity  = cafeData[cafeId].food[foodId].quantity - 1
                                            }
                                            
                                        }) {
                                            Image(systemName: "minus")
                                                .font(.system(.body))
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.black)
                                                .padding(10)
                                                .background(.gray)
                                                .clipShape(Circle())
                                        }
                                        Text("\(cafeData[cafeId].food[foodId].quantity)")
                                            .padding(.horizontal, 10)
                                            .font(.system(.title3).bold())
                                        Button(action: {
                                            cafeData[cafeId].food[foodId].quantity += 1
                                        }) {
                                            Image(systemName: "plus")
                                                .font(.system(.body))
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.black)
                                                .padding(10)
                                                .background(.gray)
                                                .clipShape(Circle())
                                        }
                                        
                                        Spacer()
                                        
                                        // Subtotal dari makanan
                                        Text("Subtotal : Rp\(calculateTotal(quantity: cafeData[cafeId].food[foodId].quantity, price: cafeData[cafeId].food[foodId].price).formatted(FloatingPointFormatStyle()))")
                                            .font(.system(.title3).bold())
                                    }
                                    Spacer()
                                }
                                .padding(8)
                                .background(.gray.opacity(0.4))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(16)
                                
                            }
                        }
                    }
                }
                
                // Menampilkan total biaya untuk semua produk
                HStack {
                    Text("Total Order :")
                        .font(.system(.title3).bold())
                    Spacer()
                    Text("Rp\(total.formatted(FloatingPointFormatStyle()))")
                        .font(.system(.title3).bold())
                    
                }.padding(.horizontal, 16)
                
                HStack {
                    // tombol untuk checkout
                    Spacer()
                    Button(action: {
                        showCheckOut.toggle()
                    }) {
                        Text("Check Out")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showCheckOut) {
                        CheckOutView(total: $total, cafeData: $cafeData)
                            .presentationDetents([.medium, .large])
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
            }
            // Jika keranjang kosong
            else {
                Text("You don't order food yet. Check out our amazing food and order it")
                    .font(.system(.title2))
                    .multilineTextAlignment(.center)
                
            }
        }.onAppear {
            self.cafeData = dummyCafe
        }
        
    }   
    
    // Menghitung jumlah total biaya secara keseluruhan
    private func calculateTotal(quantity: Int?, price: Double?) -> Double {
        if let quantity = quantity, let price = price {
            return price * Double(quantity)
            
        } else { return 0 }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
