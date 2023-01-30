//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 29/01/23.
//

import Foundation


class HomeViewModel: ObservableObject{
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init(){
        fetchCoinData()
    }
    
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response Code \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            print("DEBUG: data \(data)")
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovers()
                }
                
            } catch let error {
                print("DEBUG: failed to decode \(error)")
            }
                
        }.resume()
    }
    
    func configureTopMovers(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
