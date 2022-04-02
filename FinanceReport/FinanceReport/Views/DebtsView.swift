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
                List{
                    ForEach(viewModel.debtsArray, id: \.self) { debt in
                        ListRowDebtsView(debt: debt)
                            .swipeActions {
                                Button {
                                    self.debtToDelete = debt
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
                    
                    Button {
                        viewModel.debtsArray.append(DebtModel())
                    } label: {
                        HStack {
                            Spacer()
                            Text("Добавить долг")
                                .frame(height: 60)
                            
                            Spacer()
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
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
        //.navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}



struct DebtsView_Previews: PreviewProvider {
    static var previews: some View {
        DebtsView()
    }
}
