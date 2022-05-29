//
//  FactExpensesSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 19.05.2022.
//

import SwiftUI

struct FactExpensesSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel: FactExpensesSettingsViewModel

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack{
                HStack {
                    Text(date.formatToString(using: .ddMMyy))
                        .font(.system(size: 14))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button {
                        FactExpensesViewModel.shared.setFactExpenses(factExpense: viewModel.factExpense)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Название статьи расхода", text: $viewModel.factExpense.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Количество средств", value: $viewModel.factExpense.score, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //.background(Color("Ice8"))
                .shadow(radius: 2)
                .foregroundColor(.black)
            }
        }
        .onTapGesture {
            self.dismissKeyboard()
    }
}
}
