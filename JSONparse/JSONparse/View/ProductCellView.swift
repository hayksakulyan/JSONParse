//
//  ProductCellView.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 19.06.23.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(product.title)
                    .bold()
                Spacer()
                
                Text(product.price, format: .currency(code: "USD"))
                    .padding(5)
                    .foregroundColor(.white)
                    .background {
                        Color.green
                    }.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            Text(product.description)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product.preview)
    }
}
