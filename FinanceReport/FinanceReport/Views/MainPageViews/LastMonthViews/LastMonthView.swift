//
//  LastMonthView.swift
//  FinanceReport
//
//  Created by Олег Попов on 08.04.2022.
//

import SwiftUI

struct LastMonthView: View { // Перенос с прошлого месяца

    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = LastMonthViewModel.shared
    @State private var areLastMonthSettingsShown = false
    
    var lastMonthMoney: LastMonthModel = LastMonthModel()
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Button {
                    areLastMonthSettingsShown.toggle()
                } label: {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Перенос с прошлого месяца")
                                HStack(spacing: 0) {
                                    Text("\(viewModel.lastMonthMoney.score)")
                                    Text("₽")
                                }
                            }
                            Spacer()
                            Image(systemName: "questionmark")
                                .padding(.trailing, 0)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color("Ice8"))
                        .shadow(radius: 2)
                        .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(12)
                .foregroundColor(.black)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .shadow(radius: 6)
                .fullScreenCover(isPresented: $areLastMonthSettingsShown, content: {
                    let lastMonthSettingsViewModel = LastMonthSettingsViewModel(lastMonthMoney: lastMonthMoney)
                    LastMonthSettingsView(viewModel: lastMonthSettingsViewModel)
                })
            }
        }
    }
}

struct LastMonthView_Previews: PreviewProvider {
    static var previews: some View {
        LastMonthView(lastMonthMoney: LastMonthModel())
    }
}
