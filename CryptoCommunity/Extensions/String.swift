//
//  String.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 13.04.2022.
//

import Foundation


extension String {
    func searchFilter() -> String {
        return self.lowercased().replacingOccurrences(of: " ", with: "")
    }
}
