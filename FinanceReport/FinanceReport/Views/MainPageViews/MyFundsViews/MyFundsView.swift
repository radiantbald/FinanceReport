//
//  MyFundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.04.2022.
//

import SwiftUI

struct MyFundsView: View {
    
    @ObservedObject var viewModel = MyFundsViewModel.shared
    @State private var areMyFundsShown = false
    
    var body: some View {
        
        VStack {
            
            Button{
                areMyFundsShown.toggle()
            }label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Мои накопления")
                            HStack(spacing: 0) {
                                Text("\(viewModel.totalFunds.score)")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(12)
        .foregroundColor(.black)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 10)
        .shadow(radius: 6)
        .fullScreenCover(isPresented: $areMyFundsShown, content: {
            FundsTabView()
        })
    }
}
