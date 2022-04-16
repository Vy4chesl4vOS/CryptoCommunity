//
//  String.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 12.04.2022.
//

import Foundation

extension Double{
//    func convert() -> String {
//        return String(format:"%.4f", self)
//    }
    
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current //
//        formatter.currencyCode = "usd" //
//        formatter.currencySymbol = "$" //
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    func convertCurrency () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
}
