//
//  ListRowDebtsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 29.03.2022.
//

import SwiftUI

struct ListRowDebtsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isDebtSettingsShow = false
    
    var debt: DebtModel
    
    var body: some View {
        
        Button {
            isDebtSettingsShow.toggle()
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(debt.name)
                    HStack(spacing: 0) {
                        Text("\(debt.score)")
                        Text("₽")
                    }
                }
                
                Spacer()
                
                Image(systemName: "gear")
            }
            .padding()
            .shadow(radius: 6)
            .background(Color("Red1"))
            .cornerRadius(12)
            .shadow(radius: 6)
            .fullScreenCover(isPresented: $isDebtSettingsShow, content: {
                let debtSettingsViewModel = DebtSettingsViewModel(debt: debt)
                DebtSettingsView(viewModel: debtSettingsViewModel)
            })
        }
    }
}


struct ListRowDebtsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowDebtsView(debt: DebtModel())
    }
}
