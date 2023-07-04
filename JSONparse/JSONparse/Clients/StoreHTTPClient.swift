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
enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}
struct Resource<T: Codable> {
    let url: URL
    var headers: [String: String] = [:]
    var method: HttpMethod = .get([])
}

class StoreHTTPClient {
    
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.allHTTPHeaderFields = resource.headers
        request.httpMethod = resource.method.name
        
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                throw NetworkError.badURL
            }
            request.url = url
        case .post(_):
            break
        default: break
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let session = URLSession(configuration: configuration)
        let (data, responce) = try await session.data(for: request)
        guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200 || httpResponce.statusCode == 201 else {
            throw NetworkError.invalidResponse
        }
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return result
    }
    
//    func getCategories (url: URL) async throws -> [Category] {
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200 else {
//           throw NetworkError.invalidResponse
//        }
//        
//        guard let categories = try? JSONDecoder().decode([Category].self, from: data) else {
//            throw NetworkError.decodingError
//        }
//        
//        return categories
//    }
//    
//    func getProductByCategoryId(url: URL) async throws -> [Product] {
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200 else {
//           throw NetworkError.invalidResponse
//        }
//        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
//            throw NetworkError.decodingError
//        }
//        return products
//    }
    
}
