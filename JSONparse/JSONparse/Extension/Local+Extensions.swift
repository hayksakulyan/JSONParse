//
//  Local+Extensions.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 19.06.23.
//

import Foundation

extension Locale {
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
}
