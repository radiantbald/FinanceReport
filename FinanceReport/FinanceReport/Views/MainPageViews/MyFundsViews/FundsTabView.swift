//
//  FundsTabView.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import SwiftUI
import UIKit

struct FundsTabView: View {
    
//    init() {
//        UITabBar.appearance().unselectedItemTintColor = .systemGray6
//        UITabBar.appearance().barTintColor = .red
//    }
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = MyFundsViewModel.shared
    var body: some View {
        
        VStack {
            ZStack {
                HStack {
                    Text(date.formatToString(using: .ddMMyy))
                        .font(.system(size: 14))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button {
                        print("Мои накопления: \(viewModel.myFundsSum()) - сумма моих накоплений")
                        MyFundsViewModel.shared.setFundSum(score: viewModel.totalFunds)
                        self.dismiss()
                    } label: {
                        Text("На главную")
                            .padding(.trailing)
                    }
                }
            }
        }
        
        
        TabView() {
            FundsView()
                .tabItem{
                    VStack {
                        Image(systemName: "star.circle")
                        Text("Мои накопления")
                        
                    }
                }
            DebtsView()
                .tabItem{
                    VStack {
                        Image(systemName: "star.circle")
                        Text("Мои долги")
                    }
                }
            
            
        }
    }
}
struct FundsTabView_Previews: PreviewProvider {
    static var previews: some View {
        FundsTabView()
    }
}
