//
//  AllCoinsView.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 29/01/23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var homeViewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coin")
                
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(homeViewModel.coins) {coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(homeViewModel: HomeViewModel())
    }
}
