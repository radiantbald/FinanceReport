//
//  PlanningExpensesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import SwiftUI

struct PlanningExpensesView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = PlanningExpensesViewModel.shared
    @ObservedObject var remainderViewModel = PlanningViewModel.shared
    @State private var isActionSheetShow = false
    
    @State var expenseToDelete: PlanningExpensesModel?
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    VStack{
                        VStack {
                            ZStack {
                                HStack {
                                    Text(date.formatToString(using: .ddMMyy))
                                        .font(.system(size: 14))
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Button {
                                        PlanningViewModel.shared.setPlanningExpensesTotal(score: remainderViewModel.planningExpensesTotal)
                                        PlanningViewModel.shared.setPlanningRemainderSum(score: remainderViewModel.planningRemainderTotal)
                                        print("Предполагаемые расходы: \(viewModel.sumPlanningExpenses()) ₽,  Предполагаемый остаток \(remainderViewModel.planningRemainderSum()) ₽")
                                        self.dismiss()
                                    } label: {
                                        Text("На главную")
                                            .padding(.trailing)
                                    }
                                }
                            }
                        }
                        HStack{
                            Text("Предполагаемые доходы: \(viewModel.sumPlanningExpenses()) ₽")
                                .padding()
                            Spacer()
                        
                        Button {
                            viewModel.planningExpensesArray.append(PlanningExpensesModel())
                            print("\(viewModel.planningExpensesArray.count) статей расхода")
                        } label: {
                            HStack {
                               // Spacer()
                                Text("+")
                                    .padding(.horizontal)
                            }
                        }
                        }
                    }
                    List{
                        ForEach(viewModel.planningExpensesArray, id: \.self) { planningExpense in
                            ListRowPlanningExpensesView(planningExpense: planningExpense)
                                .swipeActions {
                                    Button {
                                        self.expenseToDelete = planningExpense
                                        isActionSheetShow.toggle()
                                    } label: {
                                        Text("Удалить")
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                    }
                                }
                        }
                        .listRowSeparatorTint(.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .black, .black, .black, .black, .black,  .clear]), startPoint: .top, endPoint: .bottom))
                    .confirmationDialog("Точно удалить?", isPresented: $isActionSheetShow, titleVisibility: .visible) {
                        Button{
                            viewModel.planningExpensesArray.removeAll() { deletedExpense in
                                deletedExpense.id == expenseToDelete!.id
                            }
                        } label: {
                            Text("Да")
                        }
                        
                        Button(role: .cancel) {
                            //нет действия
                        } label: {
                            Text("Нет")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct PlanningExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningExpensesView()
    }
}
