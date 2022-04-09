//
//  FundSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 22.03.2022.
//

import SwiftUI

struct FundSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: FundSettingsViewModel
    
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
                        FundsViewModel.shared.setFund(fund: viewModel.fund)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Название счета", text: $viewModel.fund.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Средств на счете", value: $viewModel.fund.score, formatter: NumberFormatter())
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

struct FundSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FundSettingsView(viewModel: FundSettingsViewModel(fund: FundModel()))
    }
}
