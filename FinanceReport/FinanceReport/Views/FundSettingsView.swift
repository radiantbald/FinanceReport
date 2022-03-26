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
    @State var fundSettings = ""
    
    var body: some View {
        ZStack {
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
                TextField("Средств на счете", text: $fundSettings)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                    .shadow(radius: 6)
                    .onSubmit {
                        print("Введено новое значеие")
                    }
                    
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
            if let score = Int(fundSettings) {
                viewModel.fund.score = score
            }
        }
    }
}

struct FundSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FundSettingsView(viewModel: FundSettingsViewModel(fund: FundModel()))
    }
}
