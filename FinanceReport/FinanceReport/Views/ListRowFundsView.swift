//
//  ListRowFundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 16.03.2022.
//

import SwiftUI

struct ListRowFundsView: View {
    
    @State var fundName = Fund()
    @State var fundScore = Fund()
    
    var body: some View {
        Button{
        } label: {
        
        HStack{
            
            VStack(alignment: .leading, spacing: 5){
                Text("\(fundName.name)")
                HStack(spacing: 0) {
                    Text("\(fundScore.score)")
                    Text("₽")
                }
            }
            Spacer()
            Image(systemName: "gear")
        }
            .frame(width: .infinity)
        .padding()
        .background(Color("Ice6"))
        .cornerRadius(12)
        .shadow(radius: 6)
    }
    }
}


struct ListRowFundsView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowFundsView()
    }
}
