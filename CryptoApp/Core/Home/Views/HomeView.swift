//
//  HomeView.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 29/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                TopMoversView(homeViewModel: homeViewModel)
                
                Divider()
                
                AllCoinsView(homeViewModel: homeViewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
