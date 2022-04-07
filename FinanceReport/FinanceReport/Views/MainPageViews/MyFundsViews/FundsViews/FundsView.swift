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
                VStack{
                    ZStack{
                        HStack{
                            Text("Мои накопления: \(viewModel.sumFunds()) ₽")
                                .padding(.horizontal)
                            Spacer()
                        }
                        Button {
                            viewModel.fundsArray.append(FundModel())
                            print("\(viewModel.fundsArray.count) накопительных счетов")
                        } label: {
                            HStack {
                                Spacer()
                                Text("+")
                                    .padding(.horizontal)
                            }
                        }
                    }
                    List{
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
                        
                        
                    }
                    .listStyle(PlainListStyle())
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .black, .black, .black, .black, .black,  .clear]), startPoint: .top, endPoint: .bottom))
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
                
                //                Spacer()
                //
                //
                //                LinearGradient(gradient: Gradient(colors: [.red, .init(white: 1, opacity: 0), .init(white: 1, opacity: 0)]), startPoint: .bottom, endPoint: .top)
                //                    .ignoresSafeArea(.all)
                //                    .frame(height: 50)
                
                
                
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
