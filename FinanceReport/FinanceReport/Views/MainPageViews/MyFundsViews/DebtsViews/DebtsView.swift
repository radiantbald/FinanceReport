//
//  DebtsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import SwiftUI

struct DebtsView: View {
    
    @ObservedObject var viewModel = DebtsViewModel.shared
    
    @State private var isActionSheetShow = false
    
    @State var debtToDelete: DebtModel?
    
    var body: some View {
        
        ZStack{
            VStack{
                ZStack{
                    HStack{
                        Text("Мои долги: \(viewModel.sumDebts()) ₽")
                            .padding(.horizontal)
                        Spacer()
                    }
                    Button {
                        viewModel.debtsArray.append(DebtModel())
                        print("\(viewModel.debtsArray.count) долгов")
                    } label: {
                        HStack {
                            Spacer()
                            Text("+")
                                .padding(.horizontal)
                        }
                    }
                }
                List{
                    ForEach(viewModel.debtsArray, id: \.self) { debt in
                        ListRowDebtsView(debt: debt)
                            .swipeActions {
                                Button {
                                    self.debtToDelete = debt
                                    isActionSheetShow.toggle()
                                } label: {
                                    HStack{
                                        Spacer()
                                        Text("Удалить")
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                    }
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
                        viewModel.debtsArray.removeAll() { deletedDebt in
                            deletedDebt.id == debtToDelete!.id
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
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}



struct DebtsView_Previews: PreviewProvider {
    static var previews: some View {
        DebtsView()
    }
}
