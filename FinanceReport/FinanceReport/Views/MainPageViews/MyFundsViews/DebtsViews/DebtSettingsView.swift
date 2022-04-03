//
//  DebtSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import SwiftUI

struct DebtSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: DebtSettingsViewModel
    
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
                        DebtsViewModel.shared.setDebt(debt: viewModel.debt)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Кому должен", text: $viewModel.debt.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Сколько должен", value: $viewModel.debt.score, formatter: NumberFormatter())
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

struct DebtSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DebtSettingsView(viewModel: DebtSettingsViewModel(debt: DebtModel()))
    }
}
