//
//  JSONparseApp.swift
//  JSONparse
//
//  Created by Hayk Sakulyan on 12.06.23.
//

import SwiftUI

@main
struct JSONparseApp: App {
    
    @StateObject private var storeModel = StoreModel()
    
    var body: some Scene {
        WindowGroup {
            CategoryListScreen().environmentObject(StoreModel())
        }
    }
}
