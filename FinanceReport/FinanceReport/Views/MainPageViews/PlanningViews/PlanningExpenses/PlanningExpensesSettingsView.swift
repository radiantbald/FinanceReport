//
//  PlanningExpensesSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 12.04.2022.
//

import SwiftUI

struct PlanningExpensesSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var viewModel: PlanningExpensesSettingsViewModel

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
                        PlanningExpensesViewModel.shared.setPlanningExpenses(planningExpense: viewModel.planningExpense)
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                VStack{
                    TextField("Название статьи расхода", text: $viewModel.planningExpense.name)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                    
                    TextField("Средств на счете", value: $viewModel.planningExpense.score, formatter: NumberFormatter())
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

//struct PlanningExpensesSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanningExpensesSettingsView()
//    }
//}
