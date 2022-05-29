//
//  LastMonthSettingsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 08.04.2022.
//

import SwiftUI

struct LastMonthSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: LastMonthSettingsViewModel
    @ObservedObject var planningRemainderViewModel = PlanningViewModel.shared
    @ObservedObject var factRemainderViewModel = FactViewModel.shared
    
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
                        LastMonthViewModel.shared.setLastMonthMoney(score: viewModel.lastMonthMoney)
                        PlanningViewModel.shared.setPlanningRemainderSum(score: planningRemainderViewModel.planningRemainderTotal)
                        FactViewModel.shared.setFactRemainderSum(score: factRemainderViewModel.factRemainderTotal)
                        print("С прошлого месяца осталось: \(viewModel.lastMonthMoney.score) ₽,  Предполагаемый остаток \(planningRemainderViewModel.planningRemainderSum()) ₽")
                        print("На руках денег: \(viewModel.lastMonthMoney.score) ₽,  Фактический остаток \(factRemainderViewModel.factRemainderSum()) ₽")
                        self.dismiss()
                    } label: {
                        Text("Сохранить и выйти")
                            .padding(.trailing)
                    }
                }
                
                VStack{
                    TextField("Сколько осталось с прошлого месяца?", value: $viewModel.lastMonthMoney.score, formatter: NumberFormatter())
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
                .shadow(radius: 2)
                .foregroundColor(.black)
            }
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
}

struct LastMonthSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        LastMonthSettingsView(viewModel: LastMonthSettingsViewModel(lastMonthMoney: LastMonthModel()))
    }
}
