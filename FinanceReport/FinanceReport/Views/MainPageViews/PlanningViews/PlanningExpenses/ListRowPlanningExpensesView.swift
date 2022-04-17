//
//  ListRowPlanningExpensesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 12.04.2022.
//

import SwiftUI

struct ListRowPlanningExpensesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var arePlanningExpensesSettingsShown = false
    
    var planningExpense: PlanningExpensesModel
    
    var body: some View {
        Button {
            arePlanningExpensesSettingsShown.toggle()
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text("\(planningExpense.name)")
                    HStack(spacing: 0) {
                        Text("\(planningExpense.score)")
                        Text("₽")
                    }
                }
                
                Spacer()
                
                Image(systemName: "gear")
            }
            .padding()
            .background(Color("Ice6"))
            .cornerRadius(12)
            .shadow(radius: 6)
            .fullScreenCover(isPresented: $arePlanningExpensesSettingsShown, content: {
                let planningExpensesSettingsViewModel = PlanningExpensesSettingsViewModel(planningExpense: planningExpense)
                PlanningExpensesSettingsView(viewModel: planningExpensesSettingsViewModel)

//                PlanningIncomesSettingsView(viewModel: planningIncomesSettingsViewModel, remainderViewModel: PlanningViewModel())
            })
        }
    }
}

struct ListRowPlanningExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowPlanningExpensesView(planningExpense: PlanningExpensesModel())
    }
}
