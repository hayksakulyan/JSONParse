//
//  StoreHTTPClient.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 12.06.23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case decodingError
    case invalidServerResponse
    case invalidURL
}

class StoreHTTPClient {
    
    func getCategories (url: URL) async throws -> [Category] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
           throw NetworkError.invalidResponse
        }
        
        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return categories
    }
    
    func getProductByCategoryId(url: URL) async throws -> [Product] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
           throw NetworkError.invalidResponse
        }
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodingError
        }
        return products
    }
    
}
