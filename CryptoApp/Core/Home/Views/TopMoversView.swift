//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 29/01/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(homeViewModel.topMovingCoins){coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(homeViewModel: HomeViewModel())
    }
}
