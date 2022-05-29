//
//  FactExpensesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 19.05.2022.
//

import SwiftUI

struct FactExpensesView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel = FactExpensesViewModel.shared
    @ObservedObject var remainderViewModel = FactViewModel.shared
    @State private var isActionSheetShow = false

    @State var expenseToDelete: FactExpensesModel?

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
                                        FactViewModel.shared.setFactExpensesTotal(score: remainderViewModel.factExpensesTotal)
                                        FactViewModel.shared.setFactRemainderSum(score: remainderViewModel.factRemainderTotal)
                                        print("Фактические расходы: \(viewModel.sumFactExpenses()) ₽,  Средства на руках \(remainderViewModel.factRemainderSum()) ₽")
                                        self.dismiss()
                                    } label: {
                                        Text("На главную")
                                            .padding(.trailing)
                                    }
                                }
                            }
                        }
                        HStack{
                            Text("Фактические Расходы: \(viewModel.sumFactExpenses()) ₽")
                                .padding()
                            Spacer()

                        Button {
                            viewModel.factExpensesArray.append(FactExpensesModel())
                            print("\(viewModel.factExpensesArray.count) статей расхода")
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
                        ForEach(viewModel.factExpensesArray, id: \.self) { factExpense in
                            ListRowFactExpensesView(factExpense: factExpense)
                                .swipeActions {
                                    Button {
                                        self.expenseToDelete = factExpense
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
                            viewModel.factExpensesArray.removeAll() { deletedExpense in
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


