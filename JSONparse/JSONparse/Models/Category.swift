//
//  Category.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 12.06.23.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL
}

extension Category {
    static var preview: Category {
        Category(id: 1, name: "Clothes", image: URL(string: "https://www.123rf.com/photo_15221647_imag-of-heart-in-the-blue-sky-against-a-background-of-white-clouds.html")!)
    }
}
