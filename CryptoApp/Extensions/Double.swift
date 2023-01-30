//
//  Double.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 30/01/23.
//

import Foundation


extension Double{
    private var currencyFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func toCurrency() -> String{
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    private var numberFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func toPercentString() -> String{
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
}
