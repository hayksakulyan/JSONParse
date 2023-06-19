//
//  ProductListScreen.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 19.06.23.
//

import SwiftUI

struct ProductListScreen: View {
    
    let category: Category
    @EnvironmentObject private var storeModel: StoreModel
    
    var body: some View {
        List(storeModel.products, id: \.id) { product in
            ProductCellView(product: product)
        }
        .listStyle(.plain)
        .task {
            do {
                try await storeModel.fetchProductsByCategory(category.id)
            } catch {
                print(error.localizedDescription)
            }
        }
        .navigationTitle(category.name)
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProductListScreen(category: Category(id: 1, name: "Chlotes", image: URL(string: "https://pixabay.com/photos/eiffel-tower-france-paris-landscape-975004/")!) ).environmentObject(StoreModel())
        }
    }
}
