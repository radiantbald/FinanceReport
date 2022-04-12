//
//  PlanningIncomesSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 12.04.2022.
//

import SwiftUI

struct PlanningIncomesSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel: PlanningIncomesSettingsViewModel

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
                        PlanningIncomesViewModel.shared.setPlanningIncome(income: viewModel.planningIncome)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Название статьи расхода", text: $viewModel.planningIncome.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Средств на счете", value: $viewModel.planningIncome.score, formatter: NumberFormatter())
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

struct PlanningIncomesSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningIncomesSettingsView(viewModel: PlanningIncomesSettingsViewModel(planningIncome: PlanningIncomesModel()))
    }
}
