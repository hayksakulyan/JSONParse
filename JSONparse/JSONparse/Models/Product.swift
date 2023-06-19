//
//  Product.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 19.06.23.
//

import Foundation


struct Product: Codable {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: Category
}

extension Product {
    static var preview: Product {
        Product(id: 1, title: "Hend made fresh table", price: 687, description: "Description and made esim inch", images: [URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fwallpapers%2Ftravel%2Fparis&psig=AOvVaw2KaABUDGGUrWvYM_YLlCbe&ust=1687264770564000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCPipzpytz_8CFQAAAAAdAAAAABAE")!], category: Category.preview)
    }
}
