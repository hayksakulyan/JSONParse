//
//  StoreModel.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 12.06.23.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let client = StoreHTTPClient()
    @Published private(set) var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    
    func fetchCategories() async throws {
        categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.getProductByCategoryId(url: URL.productsByCategory(categoryId))
    }
}
