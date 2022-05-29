//
//  FactIncomesSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 05.05.2022.
//

import SwiftUI

struct FactIncomesSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel: FactIncomesSettingsViewModel

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
                        FactIncomesViewModel.shared.setFactIncomes(factIncome: viewModel.factIncome)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Название статьи дохода", text: $viewModel.factIncome.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Количество средств", value: $viewModel.factIncome.score, formatter: NumberFormatter())
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
