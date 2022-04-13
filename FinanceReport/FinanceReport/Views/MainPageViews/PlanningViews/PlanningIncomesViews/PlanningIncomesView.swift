//
//  PlanningIncomesView.swift
//  FinanceReport
//
//  Created by Олег Попов on 10.04.2022.
//

import SwiftUI

struct PlanningIncomesView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = PlanningIncomesViewModel.shared
    @ObservedObject var remainderViewModel = PlanningViewModel.shared
    @State private var isActionSheetShow = false
    
    @State var incomeToDelete: PlanningIncomesModel?
    
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
                                        PlanningViewModel.shared.setPlanningIncomesTotal(score: viewModel.planningIncomesTotal)
                                        PlanningViewModel.shared.setPlanningRemainderSum(score: remainderViewModel.planningRemainder.score)
                                        print("Предполагаемые доходы: \(viewModel.sumPlanningIncomes()), \n Предполагаемый остаток \(remainderViewModel.planningRemainder.score)")
                                        self.dismiss()
                                    } label: {
                                        Text("На главную")
                                            .padding(.trailing)
                                    }
                                }
                            }
                        }
                        HStack{
                            Text("Предполагаемые доходы: \(viewModel.sumPlanningIncomes()) ₽")
                                .padding()
                            Spacer()
                        
                        Button {
                            viewModel.planningIncomesArray.append(PlanningIncomesModel())
                            print("\(viewModel.planningIncomesArray.count) статей дохода")
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
                        ForEach(viewModel.planningIncomesArray, id: \.self) { planningIncome in
                            ListRowPlanningIncomesView(planningIncome: planningIncome)
                                .swipeActions {
                                    Button {
                                        self.incomeToDelete = planningIncome
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
                            viewModel.planningIncomesArray.removeAll() { deletedIncome in
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

struct PlanningIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningIncomesView()
    }
}
