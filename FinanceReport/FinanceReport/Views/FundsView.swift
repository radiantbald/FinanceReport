//
//  FundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import SwiftUI

struct FundsView: View {
    
    @ObservedObject var viewModel = FundsViewModel.shared
    
    @State private var isActionSheetShow = false
    
    @State var fundToDelete: FundModel?
   
    
    var body: some View {
        
        ZStack{
            VStack{
                List{
                    Text("\(viewModel.sumFunds())")
                    ForEach(viewModel.fundsArray, id: \.self) { fund in
                        ListRowFundsView(fund: fund)
                            .swipeActions {
                                Button {
                                    self.fundToDelete = fund
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
                        viewModel.fundsArray.append(FundModel())
                        print("\(viewModel.fundsArray)")
                        print("\(viewModel)")
                    } label: {
                        HStack {
                            Spacer()
                            Text("Добавить новый счет")
                                .frame(height: 60)
                           
                            
                            Spacer()
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .confirmationDialog("Точно удалить?", isPresented: $isActionSheetShow, titleVisibility: .visible) {
                    Button{
                        viewModel.fundsArray.removeAll() { deletedFund in
                            deletedFund.id == fundToDelete!.id
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



struct FundsView_Previews: PreviewProvider {
    static var previews: some View {
        FundsView()
    }
}
