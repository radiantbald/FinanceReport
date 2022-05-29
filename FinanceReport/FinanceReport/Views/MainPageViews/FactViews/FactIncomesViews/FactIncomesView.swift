//
//  FactIncomesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 05.05.2022.
//

import SwiftUI

struct FactIncomesView: View {

    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel = FactIncomesViewModel.shared
    @ObservedObject var remainderViewModel = FactViewModel.shared
    @State private var isActionSheetShow = false

    @State var incomeToDelete: FactIncomesModel?

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
                                        FactViewModel.shared.setFactIncomesTotal(score: remainderViewModel.factIncomesTotal)
                                        FactViewModel.shared.setFactRemainderSum(score: remainderViewModel.factRemainderTotal)
                                        print("Фактические доходы: \(viewModel.sumFactIncomes()) ₽,  Средства на руках \(remainderViewModel.factRemainderSum()) ₽")
                                        self.dismiss()
                                    } label: {
                                        Text("На главную")
                                            .padding(.trailing)
                                    }
                                }
                            }
                        }
                        HStack{
                            Text("Фактические доходы: \(viewModel.sumFactIncomes()) ₽")
                                .padding()
                            Spacer()

                        Button {
                            viewModel.factIncomesArray.append(FactIncomesModel())
                            print("\(viewModel.factIncomesArray.count) статей дохода")
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
                        ForEach(viewModel.factIncomesArray, id: \.self) { factIncome in
                            ListRowFactIncomesView(factIncome: factIncome)
                                .swipeActions {
                                    Button {
                                        self.incomeToDelete = factIncome
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
                            viewModel.factIncomesArray.removeAll() { deletedIncome in
                                deletedIncome.id == incomeToDelete!.id
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

struct FactIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        FactIncomesView()
    }
}
