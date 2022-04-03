//
//  ListRowFundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 16.03.2022.
//

import SwiftUI

struct ListRowFundsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isFundSettingsShow = false
    
    var fund: FundModel
    
    var body: some View {
        
        Button {
            isFundSettingsShow.toggle()
        } label: {
            
            HStack{
                
                VStack(alignment: .leading, spacing: 5){
                    Text(fund.name)
                    HStack(spacing: 0) {
                        Text("\(fund.score)")
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
            .fullScreenCover(isPresented: $isFundSettingsShow, content: {
                let fundSettingsViewModel = FundSettingsViewModel(fund: fund)
                FundSettingsView(viewModel: fundSettingsViewModel)
            })
        }
    }
}


struct ListRowFundsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowFundsView(fund: FundModel())
    }
}
