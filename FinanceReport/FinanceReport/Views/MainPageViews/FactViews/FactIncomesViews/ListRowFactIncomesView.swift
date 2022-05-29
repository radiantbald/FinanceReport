//
//  ListRowFactIncomesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 05.05.2022.
//

import SwiftUI

struct ListRowFactIncomesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var areFactIncomesSettingsShown = false
    
    var factIncome: FactIncomesModel
    
    var body: some View {
        Button {
            areFactIncomesSettingsShown.toggle()
        } label: {
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text("\(factIncome.name)")
                    HStack(spacing: 0) {
                        Text("\(factIncome.score)")
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
            .fullScreenCover(isPresented: $areFactIncomesSettingsShown, content: {
                let factIncomesSettingsViewModel = FactIncomesSettingsViewModel(factIncome: factIncome)
                FactIncomesSettingsView(viewModel: factIncomesSettingsViewModel)
            })
        }
    }
}

struct ListRowFactIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowFactIncomesView(factIncome: FactIncomesModel())
    }
}
