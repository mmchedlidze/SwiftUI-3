//
//  ProductModel.swift
//  airpodshop
//
//  Created by Mariam Mchedlidze on 09.12.23.
//

import SwiftUI

@Observable
class Product: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var currency: String
    var price: Double
    var quantity: Int
    var stock: Int
    
    init(id: UUID = UUID(), image: String, name: String, currency: String, price: Double, quantity: Int, stock: Int) {
        self.id = id
        self.image = image
        self.name = name
        self.currency = currency
        self.price = price
        self.quantity = quantity
        self.stock = stock
    }
}


