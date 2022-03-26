//
//  FundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 26.03.2022.
//

import SwiftUI

struct FundsView: View {
    
    @ObservedObject var viewModel = FundsViewModel.shared
    
    var body: some View {
        
        ZStack{
            VStack{
                List{
                    ForEach(viewModel.fundsArray, id: \.self) { fund in
                        ListRowFundsView(fund: fund)
                            .swipeActions {
                                Button {
                                    viewModel.fundsArray.removeAll() { deleteFund in
                                        deleteFund.id == fund.id
                                    }
                                } label: {
                                    Text("Удалить")
                                }
                            }
                    }
                    .listRowSeparatorTint(.clear)
                    .listRowSeparator(.hidden)
                    
                    Button {
                        viewModel.fundsArray.append(FundModel())
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
