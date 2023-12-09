//
//  ContentView.swift
//  airpodshop
//
//  Created by Mariam Mchedlidze on 09.12.23.
//

import SwiftUI

struct ProductView: View {
        
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        VStack{
            ProductCardView()
            CartView()
        }.environmentObject(viewModel)
    }
}

// MARK: - Product Card

struct ProductCardView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.backgroundColor)
                .frame(width: 393, height: 730)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.product) { product in
                        
                        VStack(alignment: .leading) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.cardBackgroundColor)
                                    .frame(width: 250, height: 200)
                                
                                Image(product.image)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                            
                            .overlay(
                                Button(action: {
                                    viewModel.remove(product)
                                }) {
                                    Image(systemName: "x.circle.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.cartBackgroundColor)
                                }
                                    .offset(x: 104, y: -80)
                            )
                            
                            VStack(alignment: .center, spacing: 10) {
                                Text(product.name)
                                    .foregroundColor(.primary)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("\(product.currency) \(product.price,specifier: "%.2f")")
                                    .foregroundColor(.primary)
                                    .font(.system(size: 14, weight: .regular))
                                
                                HStack(spacing: 16) {
                                    Button(action: {
                                        if product.quantity > 0 {
                                            product.quantity -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus.circle")
                                            .font(.system(size: 20))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text("\(product.quantity)")
                                    
                                    Button(action: {
                                        if product.quantity < product.stock {
                                            product.quantity += 1
                                        }
                                    }) {
                                        Image(systemName: "plus.circle")
                                            .font(.system(size: 20))
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding([.leading, .trailing], 80
                                )
                            }
                        }
                    }
                }
            }.padding(.top, 60)
        }
    }
}
// MARK: - Cart View

struct CartView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.cartBackgroundColor)
                .frame(width: .infinity, height: 120)
            
            VStack(spacing: 8) {
                Text(" \(viewModel.totalQuantity()) Items in Cart")
                
                HStack {
                    Text("Total:")
                    Text("$ \(viewModel.totalPrice(), specifier: "%.2f")")
                } 
            }
            .foregroundColor(.cartTextColor)
            .font(.system(size: 18))
        }
    }
}


// MARK: - Preview

#Preview {
    ProductView()
}
