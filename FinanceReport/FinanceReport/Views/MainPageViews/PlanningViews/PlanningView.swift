//
//  PlanningView.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import SwiftUI

struct PlanningView: View{ // Предполагаемые доходы

    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = PlanningViewModel.shared
    @ObservedObject var planningIncomesViewModel = PlanningIncomesViewModel.shared
    @State private var arePlanningIncomesShown = false
    @State private var arePlanningExpensesShown = false
    
   // @State var planningRemainder: PlanningModel = PlanningModel()
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Button {
                arePlanningIncomesShown.toggle()
                print("Календарь доходов")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Предполагаемые доходы")
                            HStack(spacing: 0) {
                                Text("\(planningIncomesViewModel.sumPlanningIncomes())")
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
                arePlanningExpensesShown.toggle()
                print("Планируемые расходы")
            } label: {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Планируемые расходы")
                            HStack(spacing: 0) {
                                Text("\(viewModel.planningExpenses.sumPlanningExpenses())")
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
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Предполагаемый остаток")
                        HStack(spacing: 0) {
                            //Text("\(viewModel.planningRemainderSum())")
                            Text("₽")
                        }
                    }
                    Spacer()
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
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .foregroundColor(.black)
        .shadow(radius: 6)
        .fullScreenCover(isPresented: $arePlanningIncomesShown, content: {
            PlanningIncomesView()
        })
        .fullScreenCover(isPresented: $arePlanningExpensesShown) {
            PlanningExpensesView()
        }
    }
}
struct PlanningView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningView()
    }
}
