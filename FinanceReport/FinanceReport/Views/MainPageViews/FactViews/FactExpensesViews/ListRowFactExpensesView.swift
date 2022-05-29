//
//  ListRowFactExpensesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 19.05.2022.
//

import SwiftUI

struct ListRowFactExpensesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var areFactExpensesSettingsShown = false
    
    var factExpense: FactExpensesModel
    
    var body: some View {
        Button {
            areFactExpensesSettingsShown.toggle()
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text("\(factExpense.name)")
                    HStack(spacing: 0) {
                        Text("\(factExpense.score)")
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
            .fullScreenCover(isPresented: $areFactExpensesSettingsShown, content: {
                let factExpensesSettingsViewModel = FactExpensesSettingsViewModel(factExpense: factExpense)
                FactExpensesSettingsView(viewModel: factExpensesSettingsViewModel)
            })
        }
    }
}

struct ListRowFactExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowFactExpensesView(factExpense: FactExpensesModel())
    }
}
