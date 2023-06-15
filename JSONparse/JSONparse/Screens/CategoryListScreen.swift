//
//  CategoryListScreen.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 13.06.23.
//

import SwiftUI

struct CategoryListScreen: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    @State private var errorMessage = ""
    @State private var switcher = false
    
    var body: some View {
        VStack {
            
            List(storeModel.categories, id: \.id) { category in
                HStack {
                    AsyncImage(url: category.image) { image in
                        image.resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .scaleEffect(switcher ? 1.2 : 1)
                            .animation(.linear, value: switcher)
                            .onTapGesture {
                                switcher.toggle()
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    Text(category.name)
                }
                
            }.task {
                do {
                    
                    try await storeModel.fetchCategories()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            Text(errorMessage)
        }
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen().environmentObject(StoreModel())
    }
}
