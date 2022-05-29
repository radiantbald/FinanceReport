//
//  FactView.swift
//  FinanceReport
//
//  Created by Олег Попов on 03.05.2022.
//

import SwiftUI

struct FactView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = FactViewModel.shared
    @ObservedObject var factIncomesViewModel = FactIncomesViewModel.shared
    @State private var arefactIncomesShown = false
    @State private var arefactExpensesShown = false
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Button {
                arefactIncomesShown.toggle()
                print("Фактические доходы")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Фактические доходы")
                            HStack(spacing: 0) {
                                Text("\(factIncomesViewModel.sumFactIncomes())")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "calendar")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
            
            Button {
                arefactExpensesShown.toggle()
                print("Фактические расходы")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Фактические расходы")
                            HStack(spacing: 0) {
                                Text("\(viewModel.factExpenses.sumFactExpenses())")
                                Text("₽")
                            }
                        }
                        Spacer()
                        Image(systemName: "calendar")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color("Ice8"))
                    .shadow(radius: 2)
                    .foregroundColor(.black)
                }
            }
            
            Button {
                print("Средства на руках")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Средства на руках")
                            HStack(spacing: 0) {
                                Text("\(viewModel.factRemainderTotal.score)")
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
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .foregroundColor(.black)
        .shadow(radius: 6)
        .fullScreenCover(isPresented: $arefactIncomesShown, content: {
            FactIncomesView()
        })
        .fullScreenCover(isPresented: $arefactExpensesShown, content: {
            FactExpensesView()
        })
    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        FactView()
    }
}
