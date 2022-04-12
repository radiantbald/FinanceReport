//
//  ListRowPlanningIncomesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 12.04.2022.
//

import SwiftUI

struct ListRowPlanningIncomesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var arePlanningIncomesSettingsShown = false
    
    var planningIncome: PlanningIncomesModel
    
    var body: some View {
        Button {
            arePlanningIncomesSettingsShown.toggle()
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text("\(planningIncome.name)")
                    HStack(spacing: 0) {
                        Text("\(planningIncome.score)")
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
            .fullScreenCover(isPresented: $arePlanningIncomesSettingsShown, content: {
                let planningIncomesSettingsViewModel = PlanningIncomesSettingsViewModel(planningIncome: planningIncome)
                PlanningIncomesSettingsView(viewModel: planningIncomesSettingsViewModel)
            })
        }
    }
}

struct ListRowPlanningIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowPlanningIncomesView(planningIncome: PlanningIncomesModel())
    }
}
