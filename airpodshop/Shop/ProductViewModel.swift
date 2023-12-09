//
//  SwiftUIView.swift
//  airpodshop
//
//  Created by Mariam Mchedlidze on 09.12.23.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published  var product: [Product] = [
        Product(image: "item1", name: "Apple", currency: "$", price: 1.89, quantity: 0, stock: 5),
        Product(image: "item2", name: "Pineapple", currency: "$", price: 5.49, quantity: 0, stock: 8),
        Product(image: "item3", name: "Orange", currency: "$", price: 2.38, quantity: 0, stock: 2),
        Product(image: "item4", name: "Grapes", currency: "$", price: 3.10, quantity: 0, stock: 3),
    ]
    
    func totalQuantity() -> Int {
        product.reduce(0) { $0 + $1.quantity }
    }
    
    func totalPrice() -> Double {
        product.reduce(0) { $0 + ($1.price * Double($1.quantity))}
    }
    
    func remove(_ product: Product) {
        if let index = self.product.firstIndex(where: { $0.id == product.id }) {
            self.product.remove(at: index)
        }
    }
}
