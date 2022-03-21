//
//  MyFundsView.swift
//  FinanceReport
//
//  Created by Олег Попов on 14.03.2022.
//

import SwiftUI

struct MyFundsView: View {
    
    @State var selected = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack{
            VStack{
                ZStack{
                    VStack(alignment: .center){
                        
                    }
                    
                    HStack {
                        
                        Text(date.formatToString(using: .ddMMyy))
                            .font(.system(size: 14))
                            .padding(.leading)
                        
                        
                        Spacer()
                        
                        Button {
                            self.dismiss()
                        } label: {
                        Text("На главную")
                                .padding(.trailing)
                        }
                        
                    }
                }
                Spacer()
                
                if self.selected == 0 {
                    Funds()
                } else if self.selected == 1 {
                    Duties()
                }
                Spacer()
            }
            VStack{
                
                Spacer()
                
                ZStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            self.selected = 0
                            
                        }) {
                            VStack{
                                Image(systemName: "star.circle")
                                Text("Мои накопления")
                                
                            }
                        }
                        .foregroundColor(self.selected == 0 ? .green : .gray)
                        
                        Spacer()
                        
                        Button(action: {
                            self.selected = 1
                            
                        }) {
                            VStack{
                                Image(systemName: "star.circle")
                                Text("Мои долги")
                            }
                        }
                        .foregroundColor(self.selected == 1 ? .red : .gray)
                        
                        Spacer()
                    }
                }
            } // нижний Tabbar
            .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            // .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}


struct Funds: View {
    
    @ObservedObject var realFunds = MoneySum()
    
    var body: some View {
        
        ZStack{
            VStack{
                List{
                    ForEach(realFunds.fundsArray, id: \.self) {_ in
                        ListRowFundsView()
                    }
                    Button {
                        realFunds.fundsArray.append(0)
                    } label: {
                        Text("Добавить новый счет")
                            .frame(height: 60)
                    }
                }
                .listStyle(PlainListStyle())
                .listRowSeparatorTint(.clear)
                .listRowSeparator(.hidden)
            }
        }
        //.navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct Duties: View {
    
    var body: some View {
        Text("Мои долги")
    }
}


struct MyFundsView_Previews: PreviewProvider {
    static var previews: some View {
        MyFundsView()
    }
}

